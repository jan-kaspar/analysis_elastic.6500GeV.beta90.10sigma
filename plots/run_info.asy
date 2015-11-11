//----------------------------------------------------------------------------------------------------

transform swToHours = scale(1/3600, 1);

//----------------------------------------------------------------------------------------------------

string run_datasets[];
int runs[];
real ts_from[], ts_to[];
pen colors[];

void AddRun(string ds, int r, real f, real t, pen p = yellow)
{
	run_datasets.push(ds);
	runs.push(r);
	ts_from.push(f);
	ts_to.push(t);
	colors.push(p);
}

AddRun("DS1", 9874, 20980, 21056);
AddRun("DS1", 9875, 21105, 21176);
AddRun("DS1", 9876, 21335, 21714);
AddRun("DS1", 9877, 21782, 23302);
AddRun("DS1", 9879, 23535, 23902);
AddRun("DS1", 9881, 24066, 25317);
AddRun("DS1", 9883, 25474, 31456);

AddRun("DS2", 9893, 53002, 53350);
AddRun("DS2", 9895, 54170, 54581);
AddRun("DS2", 9896, 54618, 55797);
AddRun("DS2", 9898, 56135, 59114);

/*
AddRun("DS4", 9940, 83014, 86464);
AddRun("DS4", 9950, 88653, 89502);
AddRun("DS4", 9952, 89861, 90408);

AddRun("DS5", 9958, 120794, 122146);
AddRun("DS5", 9959, 122299, 123193);
AddRun("DS5", 9960, 123282, 123752);
AddRun("DS5", 9961, 123804, 123855);
AddRun("DS5", 9963, 124110, 125274);
*/

//----------------------------------------------------------------------------------------------------

void DrawRunBands(string ds_filter="", real y_min=0, real y_max=0, bool details=true)
{
	for (int i : runs.keys)
	{
		if (ds_filter != "")
			if (run_datasets[i] != ds_filter)
				continue;

		//yaxis(XEquals(ts_from[i]/3600, false), dashed);
		//yaxis(XEquals(ts_to[i]/3600, false), dashed);
		real x_min = ts_from[i]/3600, x_max = ts_to[i]/3600;

		pen p = (details) ? colors[i]+opacity(0.3) : yellow+opacity(0.3);
		filldraw((x_min, y_min)--(x_max, y_min)--(x_max, y_max)--(x_min, y_max)--cycle, p, nullpen);

		if (details)
			label(format("{\SmallerFonts %u}", runs[i]), ((x_min + x_max)/2, y_max), S);
	}
}

//----------------------------------------------------------------------------------------------------

void DrawRunBoundaries(string ds_filter="")
{
	for (int i : runs.keys)
	{
		if (ds_filter != "")
			if (run_datasets[i] != ds_filter)
				continue;

		yaxis(XEquals(ts_from[i]/3600, false), dashed);
		yaxis(XEquals(ts_to[i]/3600, false), dashed);
	}
}
