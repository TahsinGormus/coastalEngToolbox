# Coastal Engineering Toolbox

I'm planning to arrange my codes and upload some of them here.

***
Notes about the zero-crossing analysis:

(ZeroCrossing.py)
- The input data should be an Excel file where the first column is time (equidistant), followed by fluctuating amplitudes.
- The output is saved to seperate text files for each column, and plotted in the Python environment.

(ZeroCrossingForWaves.m)
- It asks you the sea surface level data upon running the code. Provide the data as one-column numericals. The surface levels meant to be referenced from the bottom.
- The data points must be equidistant, i.e. the interval between the data points is always the same. The code also asks you this interval. If you have a non-equidistant data, please interpolate before using this code.
- The output is a two-column text file, including wave height and period of each wave. The significant wave height is also calculated and printed in the screen.
***

***
Notes about the wave shoaling calculations:
- Two codes are available for both calculating the transformed wave height from the deep sea wave height; and the deep sea wave height from the transformed wave height (denoted as inverse calculation).
- The codes benefit from the n coefficient for calculating wave heights under the shoaling transformation conditions. As you might already know, this coefficient equals to 0.5 in deep water, where it begins to change as the waves approach the shoreline. It is said that n=1 for non-dispersive conditons of shallow water. The shoaling coefficient (Ks) is calculated from aforementioned n coefficient.
***

***
Earlier MathWorks links are given below.
- Zero up/down crossing method for waves:
[![View Zero up/down crossing method for waves on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/62614-zero-up-down-crossing-method-for-waves)
- Surf zone wave heights and periods:
[![View Surf zone wave heights and periods on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/62612-surf-zone-wave-heights-and-periods)
- Deep sea wave height:
[![View Deep sea wave height on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/62613-deep-sea-wave-height)
***
