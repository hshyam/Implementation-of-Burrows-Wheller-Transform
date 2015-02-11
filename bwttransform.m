clear all; 
clc; 
file_open=fopen('sample1.txt','r'); 
file_read=fread(file_open,'uint8'); 
fclose(file_open); 
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
 
% Reverse BWT implementation 
reverse_bwt_file=fopen('bwtSample1.txt','r'); 
reverse_bwt_read=fread(reverse_bwt_file,'uint8'); 
fclose(reverse_bwt_file); 
 
bwt_data=reverse_bwt_read(1:length(reverse_bwt_read)-1); 
primary_index=reverse_bwt_read(length(reverse_bwt_read)); 
 
 
sorted_data=sort(bwt_data); 
vector_flag=ones(1,length(bwt_data))'; 
vector=zeros(1,length(bwt_data))'; 

% Matrix
for i=1:length(sorted_data) 
    for j=1:length(sorted_data) 
        if(bwt_data(j)==sorted_data(i) && vector_flag(j))  
            vector_flag(j); 
            vector(i)=j; 
            vector_flag(j)=0; 
            break    
        end 
    end 
end 
 
index=primary_index; 
reconst_data=zeros(1,length(bwt_data)); 

% Collecting original input sequence 
for i=1:length(bwt_data) 
       reconst_data(i)=bwt_data(index); 
       index=vector(index); 
   end 
   
    
   char(lexi_sorted_data(:,length(a))) 
   primary_index=find(ind==2) 
   char(reconst_data) 
       