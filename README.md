#  nklab-neuro-utils
Singularity image with a number of data management utilities

---

## Build Singularity Image

* You will need to have singularity 2.4 or greater installed. Simply clone this repository to a convenient directory.
* Navigate into the `nklab-neuro-utils`directory and check that you have a Singularity definiton file `Singularity` and the directory `src`
* Confirm that `src` folder and all the files in `src` have full read and write privileges. if not then `sudo chmod -R 777 src` should accomplish this.
* Now simply build the image as  `sudo singularity build nklab-neuro-utils.simg Singularity` - note that the image name is assumed to be `nklab-neuro-utils.simg` but this can be changed to a more convenient label. 
