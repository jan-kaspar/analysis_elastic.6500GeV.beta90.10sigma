#include "../input_files_base.h"

std::vector<std::string> input_files;

void InitInputFiles()
{
	InitInputFilesBase();

	input_files.clear();

	for (unsigned int idx = 205; idx < 245; ++idx)
		input_files.push_back(input_files_full[idx]);
}
