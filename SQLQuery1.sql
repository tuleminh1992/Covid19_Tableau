-- 1. Compare Global Number between Cases, Deaths and Death Percentage
Select	sum(new_cases) as total_cases, 
		SUM(cast(new_deaths as int)) as total_deaths,
		sum(cast(new_deaths as int))/sum(new_cases) * 100 as Death_Percentage
FROM dbo.CovidDeaths$
where continent is null
order by 1,2

--2. Find the Total Death based on Country
Select location, Sum(cast(new_deaths as int)) as Total_Death_Count
From CovidDeaths$
Where continent is null
and location not in ('World', 'European Union', 'International')
Group by Location
order by 2 desc

-- 3. Calculate Highest Infected Cases and the Percent of Population between Countries
Select Location, Population, Max(total_cases) as Highest_Infection_Count, Max((total_cases/population)) *100 as Percent_Population_Infected
From CovidDeaths$
Group by Location, Population
order by 4 desc

--4. Calculate Highest Infected Cases and Percent of Population between Countries and Date
Select Location, Population,  cast(Date as Date) as Date ,Max(total_cases) as Highest_Infection_Count, Max((total_cases/population)) *100 as Percent_Population_Infected
From CovidDeaths$
Group by Location, Population, Date
order by 5 desc





