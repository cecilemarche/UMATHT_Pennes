# UMATHT for Pennes Equation in Abaqus

This is a UMATHT implementation of the Pennes bioheat equation ; it translates the equation to a form fit for use as an Abaqus subroutine by expressing it in terms of internal energy per mass $U$, thermal flux $\overrightarrow{q}$, and their respective partial derivatives with respect to the temperature and the temperature gradient.


<a id="orge0b2b97"></a>

## Inputs

Units are given as an indication, adapt to your own model if relevant.

-   PROPS(1) : Tissue density [kg/m^3]
-   PROPS(2) : Tissue specific heat capacity [J/(kg*K)]
-   PROPS(3) : Tissue conductivity [W/(m K)]
-   PROPS(4) : Tissue perfusion rate [1/s]
-   PROPS(5) : Tissue metabolic heat generation [W/m^3]
-   PROPS(6) : Blood density [kg/m^3]
-   PROPS(7) : Blood specific heat capacity [J/(kg*K)]
-   PROPS(8) : Blood temperature [K]


<a id="org0c3d15a"></a>

## Citation

Feel free to use this code for your own analyses, and please cite it as C. Marché, "Pennes UMATHT", Gefen Lab, GitHub, 2023. Available: <https://github.com/cecilemarche/UMATHT_Pennes>.


<a id="org9496b4f"></a>

## License

This code is licensed under the CeCILL-B license, Version 2.1. Refer to the [license file](LICENSE.md) included with the code for more information on its usage and redistribution. 


<a id="org5ff65eb"></a>

## Reference

Pennes, Harry H.  Analysis of Tissue and Arterial Blood Temperatures in the Resting Human Forearm . Journal of Applied Physiology 1, no. 2 (August 1948): 93 122. <https://doi.org/10.1152/jappl.1948.1.2.93>.

