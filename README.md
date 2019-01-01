# Random Land Generator

![Alt text](random-mountains.png?raw=true "Random Land Example")

generates random land within a region of space

## How does it work?

The base layer is generated with a true random size and position relative to the region of space. Subdivisions along the length of the region of space are predefined by preference varaibles. After the base parts are generated the next layer is created with a depth double the first layer height. The function will loop until the max height is occupied. As the layers step towards the top they center closer so there is no overhanging parts or too steep of inclines
