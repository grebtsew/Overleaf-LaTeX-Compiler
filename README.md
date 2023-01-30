# Overleaf-LaTeX-Compiler
Since Overleaf online free edition compile only offers a one minute maximum compile time for LaTeX projects this project was created to compile arbitrary LaTeX documents locally of any size. The project contains a docker container facilitate usage. The steps below describe the user steps. 

0. Install necessary programs needed to run the compile.tex.sh script (not needed if using docker). A list of the required programs can be found in the `Dockerfile`.
1. Start by placing your LaTeX projects in the `./document` folder, either as a project folder or `.zip` download from `Overleaf`.  
2. Define path to the main project `.tex` file that should be compiled in the `compilelist.txt` file. The relative path is important, an example of an appropriate path would be: `documents/project/thesis_main.tex`.
3. Run the compile script locally or via docker, see how below.
4. The resulting compiled `.pdf` file is moved into the `./target` folder. Done! 

**NOTE**: The `./document` and `./target` folder is ignored by git tracking, it is safe to place documents within the folders.
# Running Locally
Run the  `compile.tex.sh` script:
```
# Make file executable:
chmod +x ./compile.tex.sh
# Run script:
./compile.tex.sh
```
# Running on Docker
The `Dockerfile` contains a programs and requirements needed to create the Ubuntu:22.04 docker containers. The containers can be executed directly through docker or with docker-compose. The command below will execute the container.
```
docker-compose up --build
```
**NOTE**: This container takes a long time to build the first time. It is primarily the downloading and installation of programs in the container that takes time. Once the container is built, it is convenient to run it every time documents are to be compiled.

# License
This project is created under a [MIT LICENSE](./LICENSE).

Copyright (c) 2023 Grebtsew