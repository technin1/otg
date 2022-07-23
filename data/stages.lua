-- Minlevel and multiplier are MANDATORY
-- Maxlevel is OPTIONAL, but is considered infinite by default
-- Create a stage with minlevel 1 and no maxlevel to disable stages
experienceStages = {
	{
		minlevel = 1,
		maxlevel = 8,
		multiplier = 75
	}, {
		minlevel = 9,
		maxlevel = 75,
		multiplier = 50
	}, {
		minlevel = 76,
		maxlevel = 150,
		multiplier = 45
	}, {
		minlevel = 151,
		maxlevel = 225,
		multiplier = 40
	}, {
		minlevel = 225,
		multiplier = 20
	}
}

skillsStages = {
	{
		minlevel = 10,
		maxlevel = 60,
		multiplier = 15
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 10
	}, {
		minlevel = 81,
		maxlevel = 110,
		multiplier = 6
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 4
	}, {
		minlevel = 126,
		multiplier = 2
	}
}

magicLevelStages = {
	{
		minlevel = 0,
		maxlevel = 60,
		multiplier = 10
	}, {
		minlevel = 61,
		maxlevel = 80,
		multiplier = 7
	}, {
		minlevel = 81,
		maxlevel = 100,
		multiplier = 5
	}, {
		minlevel = 101,
		maxlevel = 110,
		multiplier = 4
	}, {
		minlevel = 111,
		maxlevel = 125,
		multiplier = 3
	}, {
		minlevel = 126,
		multiplier = 2
	}
}
