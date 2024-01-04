
SELECT *
From PortfolioProject..CovidDeaths
where continent is not null
ORDER BY 3,4



SELECT *
From PortfolioProject..CovidVaccinations
ORDER BY 3,4



SELECT location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2


--Death Percentage
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

--Total Death Percentage by Date
SELECT date, sum(total_cases) as TotalCases, sum(total_deaths) as TotalDeaths, (sum(total_deaths)/sum(total_cases))*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null
group by date 
order by date

--Total Cases per 100,000 Population
SELECT location, date, total_cases, population, 100000 *total_cases/population as CasesPer100k
From PortfolioProject..CovidDeaths
where continent is not null
order by 1,2

--Total Cases per 100,000 Population by Country
SELECT location, max(total_cases) as TotalCases, max(population) as Population, 100000 *max(total_cases)/max(population) as CasesPer100k
From PortfolioProject..CovidDeaths
where continent is not null
group by location
order by 1,2


--Total Cases per 100,000 Population by Date
SELECT date, sum(total_cases) as TotalCases, MAX(sum(population)) OVER() as Population, (100000 * sum(total_cases)/sum(population)) as CasesPer100k
From PortfolioProject..CovidDeaths
where continent is not null
and location != 'England'
and location != 'Scotland'
and location != 'Wales'
and location != 'Northern Ireland'
group by date
order by date


--People Vaccinated per 100,000 Population
With VaccRate(Location, Date, Population, PeopleVaccinated)
as
(SELECT dea.location,dea.date, dea.population, 
	CASE
		WHEN vac.people_vaccinated is null THEN max(vac.people_vaccinated) OVER (PARTITION BY dea.location order by dea.date) ELSE vac.people_vaccinated
	END
		AS people_vaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
)
SELECT *, 100000 * PeopleVaccinated/Population as VaccinatedPer100k
FROM VaccRate
ORDER BY Location, Date


--People Vaccinated per 100,000 Population by Date
SELECT s.date,max(sum(s.population)) over() as Population, sum(s.people_vaccinated) as TotalPeopleVaccinated, 100000 * sum(s.people_vaccinated) / sum(s.population) as VaccinatedPer100k
FROM(SELECT dea.location,dea.date, dea.population, 
		CASE
			WHEN vac.people_vaccinated is null THEN max(vac.people_vaccinated) OVER (PARTITION BY dea.location order by dea.date) ELSE vac.people_vaccinated
		END
			AS people_vaccinated
	FROM PortfolioProject..CovidDeaths dea
	JOIN PortfolioProject..CovidVaccinations vac
		On dea.location = vac.location
		and dea.date = vac.date
	where dea.continent is not null
	and dea.location != 'England'
	and dea.location != 'Scotland'
	and dea.location != 'Wales'
	and dea.location != 'Northern Ireland') s
GROUP BY s.date
ORDER BY s.date


--Countries with the Highest Cases per 100,000 Population
SELECT TOP 5 location, population, MAX(total_cases) as HighestInfectionCount, 100000 * MAX(total_cases)/population as CasesPer100k
From PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY location, population
order by CasesPer100k DESC


--Countries with the Highest Death Percentage Compared to The Infections
SELECT TOP 5 location, MAX(total_deaths) as TotalDeathCount, MAX(total_cases) as TotalCases,  MAX(total_deaths)/MAX(total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
WHERE continent is not null
GROUP BY location
order by DeathPercentage DESC


--Countries with the Highest Vaccinated People per 100,000 Population
SELECT TOP 5 s.location,max(s.population) as Population, max(s.people_vaccinated) as TotalPeopleVaccinated, 100000 * max(s.people_vaccinated) / max(s.population)  as VaccinatedPer100k
FROM(SELECT dea.location,dea.date, dea.population, 
		CASE
			WHEN vac.people_vaccinated is null THEN max(vac.people_vaccinated) OVER (PARTITION BY dea.location order by dea.date) ELSE vac.people_vaccinated
		END
			AS people_vaccinated
	FROM PortfolioProject..CovidDeaths dea
	JOIN PortfolioProject..CovidVaccinations vac
		On dea.location = vac.location
		and dea.date = vac.date
	where dea.continent is not null) s
GROUP BY s.location
ORDER BY VaccinatedPer100k DESC



--Total Counts per 100,000 Population By Continent
SELECT s.continent as Continent, 100000 * SUM(s.DeathCount) / SUM(s.population) as TotalDeathCountp100, 100000 * SUM(s.CaseCount)/SUM(s.population) as TotalCaseCountp100, 100000 * SUM(s.VaccinationCount)/SUM(s.population) as TotalVaccinationCountp100
FROM(SELECT dea.continent, dea.location, MAX(dea.population) as population, MAX(dea.total_deaths) as DeathCount, MAX(dea.total_cases) as CaseCount, MAX(vac.total_vaccinations) as VaccinationCount
	FROM PortfolioProject..CovidDeaths dea
	JOIN PortfolioProject..CovidVaccinations vac
		On dea.location = vac.location
	where dea.continent is not null
	and dea.location != 'England'
	and dea.location != 'Scotland'
	and dea.location != 'Wales'
	and dea.location != 'Northern Ireland'
	GROUP BY dea.location, dea.continent) s
GROUP BY Continent



--Creating View to store data for later visualizations

USE PortfolioProject
GO

Create View IncidenceRateP100kByCountry as
SELECT continent,location, population, MAX(total_cases) as HighestInfectionCount, (100000 * MAX(total_cases)/population) as IncidenceRateP100k
From PortfolioProject..CovidDeaths
WHERE continent is not null
and location != 'England'
and location != 'Scotland'
and location != 'Wales'
and location != 'Northern Ireland'
GROUP BY location, population,continent



Create View DeathPercentageByCountryAndDate as 
SELECT location, date, total_cases, total_deaths, (total_deaths/total_cases)*100 as DeathPercentage
From PortfolioProject..CovidDeaths
where continent is not null
and location != 'England'
and location != 'Scotland'
and location != 'Wales'
and location != 'Northern Ireland'


Create View TotalCounts as 
SELECT dea.continent, dea.location,MAX(dea.population) as population, MAX(dea.total_deaths) as TotalDeathCount, MAX(dea.total_cases) as TotalCaseCount, MAX(vac.total_vaccinations) as TotalVaccinationCount
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
where dea.continent is not null
and dea.location != 'England'
and dea.location != 'Scotland'
and dea.location != 'Wales'
and dea.location != 'Northern Ireland'
GROUP BY dea.location, dea.continent



CREATE VIEW PopulationVaccinatedandInfected as
SELECT dea.continent, dea.location,dea.date, dea.population, dea.total_cases, 
	CASE
		WHEN vac.people_vaccinated is null THEN max(vac.people_vaccinated) OVER (PARTITION BY dea.location order by dea.date) ELSE vac.people_vaccinated
	END
		AS people_vaccinated
FROM PortfolioProject..CovidDeaths dea
JOIN PortfolioProject..CovidVaccinations vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null
and dea.location != 'England'
and dea.location != 'Scotland'
and dea.location != 'Wales'
and dea.location != 'Northern Ireland'



