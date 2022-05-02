

/volume2/web/seashell/bu-mox$ 
rsync -avz --exclude '*_to_*' --exclude 'CHG_*.txt' --exclude 'CHH_*.txt' --exclude 'CpG_*txt' \
--progress sr320@mox.hyak.uw.edu:/gscratch/scrubbed/sr320/ scrubbed/



/volume2/web/seashell/bu-mox$ 
rsync -avz --progress sr320@mox.hyak.uw.edu:/gscratch/srlab/sr320/ .


/home/shared/8TB_HDD_01/sr320/github$ 
rsync -avz . \
sr320@gannet.fish.washington.edu:/volume2/web/seashell/bu-github/
