# Bivot-Savart Law calculation

Bivot-Savart Law for calculating the Magnetic field of some parametrization curves

# Output examples
![Toroid](https://github.com/IvanVnucec/Biot-Savart-law/blob/master/output_examples/toroid.bmp)
![Coil1](https://github.com/IvanVnucec/Biot-Savart-law/blob/master/output_examples/coil1.bmp)
![Coil2](https://github.com/IvanVnucec/Biot-Savart-law/blob/master/output_examples/coil2.bmp)

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Matlab only

### Installing

1. Clone this repository,
2. Open `main.m` file and there you have parameters to tweak.


## Running
To get some data out of the system one should:
1. Modify the parameters in the `main.m` file:
```
x_start =  -2;
x_stop  =   2;
x_inst  =  40;

y_start =  -2;
y_stop  =   2;
y_inst  =  40;

z_start =  -5;
z_stop  =   5;
z_inst  =  40;
```
Where `x_start` and `x_stop` (`y_start`, `z_start` etc..) specefies how big will the render be in terms of axes. Variables `x_inst`,  `y_inst` and `z_inst` respectivly are defining how much points are there to calculate magnetic field in their position.

Also, user should define some curve to draw. Lets draw coil for example:
To draw a coil user should write this line below.
```
line = define_coil([0, 0, -4]', 0.5, 5, 7, 1000);
```
The function `define_coil` is defined as `define_coil(c_point, Radius, Num_of_turns, Length, Instances)` where:
- `c_point` is major-column vector of bottom center of coil, 
- `Radius` is radius of coil,
- `Num_of_turns` is how much turns the coil has over its lenght,
- `Length` is length of coil,
- `Instances` is number of points of the coil. For more precise calculation bigger number is better.

2. Press Run button.

## Authors

* **Ivan Vnučec** - [GitHub](https://github.com/IvanVnucec)
                  - [LinkedIn](https://www.linkedin.com/in/ivan-vnucec/)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details
