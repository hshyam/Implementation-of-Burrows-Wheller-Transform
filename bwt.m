function bwt    
clear all; 
clc; 
path=pwd; 
[filename, pathname] = uigetfile('*.txt', 'Pick a file'); 
cd(pathname) 
file_open=fopen(filename,'r'); 
file_read=fread(file_open,'uint8'); 
fclose(file_open); 
cd(path) 
disp('Computing bwt'); 
a=file_read; 
b=zeros(1,2*length(a)); 
 
for sort_len=1:length(b) 
    if(sort_len>length(a)) 
    b(sort_len)=a(sort_len-length(a)); 
else 
    b(sort_len)=a(sort_len); 
end 
end 

a=char(a); 
b=char(b); 
to_sort=zeros(length(a),length(a)); 
for row_sort=1:length(a) 
    to_sort(row_sort,:)=b(row_sort:length(a)+row_sort-1); 
end 

char(to_sort); 
[lexi_sorted_data,ind]=sortrows(to_sort); 
char(lexi_sorted_data); 
 
bwt_data=lexi_sorted_data(:,length(a)); 
primary_index=find(ind==2); 
out_data=[bwt_data',primary_index]; 
file_bwt=fopen('bwtSample1.txt','w'); 
fwrite(file_bwt,out_data,'uint8'); 
fclose(file_bwt); 
disp('Done'); 

 