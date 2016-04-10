set talk off
do mm
use &gg-hz
copy to &gg-ht
use &gg-ht
MODIFY REPORT he3-51.frx
REPORT FORMAT he3-51.frx ENVIRONMENT PREVIEW
return
*********
