function reversebwt 
clear all; 
clc; 
reverse_bwt_file=fopen('bwtSample1.txt','r'); 
reverse_bwt_read=fread(reverse_bwt_file,'uint8'); 
fclose(reverse_bwt_file); 
disp('Computing reverse bwt'); 
 
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
   
   rec_file=fopen('original_sequence.txt','w'); 
   fwrite(rec_file,reconst_data,'uint8'); 
   fclose(rec_file); 
   disp('Done'); 