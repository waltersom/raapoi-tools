#!/bin/bash

#SBATCH -c 2
#SBATCH --mem=4G
#SBATCH --time=08:00:00
#SBATCH -o notebook-%A.out

IP=`hostname -i`
PORT=`shuf -i 2000-65000 -n 1`

export XDG_RUNTIME_DIR=""

module load R/CRAN/3.5
R -e "IRkernel::installspec(name = 'ir35', displayname = 'R 3.5')"

$HOME/anaconda3/bin/jupyter notebook --ip=$IP --port=$PORT --no-browser
