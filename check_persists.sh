printf "/bin inny niż 777\n" > all_file.txt
find /bin -type f ! -perm 777 >> all_file.txt
printf "\n/boot inny niż 777\n" >> all_file.txt
find /boot -type f ! -perm 777 >> all_file.txt
printf "\n/etc inny niż 611\n" >> all_file.txt
find /etc -type f ! -perm 611 >> all_file.txt
printf "\n/var inny niż 611\n" >> all_file.txt
find /var -type f ! -perm 611 >> all_file.txt


#Jeśli chcemy nierekurencyjnie to możemy sterować głębokością 
#zagnieżdżenia przy użyciu mindepth i maxdepth.
