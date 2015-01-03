nfiles=5952
f=open("FixR.gnp",'w')
f.write("set xrange [-6:0] \n")
f.write("set yrange [-2:2]\n")
f.write('set xlabel "q_2" \n')
f.write('set ylabel "p_1" \n')
f.write("unset key\n")
f.write("set terminal pdf\n")
f.write("set termopt enhanced\n")
f.write('set output "FixR.pdf"\n')  
f.write("set multiplot\n")
for j in range(2,nfiles):
    f.write('plot "DAT/sp_fixed_'+str(j).zfill(5)+'_down.txt" u 1:2 w l\n')
    f.write('plot "DAT/sp_fixed_'+str(j).zfill(5)+'_down.txt" u 3:4 w l\n')
    f.write('plot "DAT/sp_fixed_'+str(j).zfill(5)+'_up.txt" u 1:2 w l \n')
    f.write('plot "DAT/sp_fixed_'+str(j).zfill(5)+'_up.txt" u 3:4 w l\n')

f.close()
