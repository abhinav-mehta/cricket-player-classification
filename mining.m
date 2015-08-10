data = xlsread('dataset.xls');
[coeff,score,latent] = pca(data);
dim = 0;
for i = 1:5
   if(sum(latent(1:i))/sum(latent)>0.9) 
       dim = i;
       break;
   end
end
coeff_new = coeff(:,1:3);
data_new = data*coeff_new;
figure;
subplot(2,2,1);
x = data_new(:,1);
y = data_new(:,2);
z = data_new(:,3);
scatter3(x,y,z);
subplot(2,2,2);
z1 = linkage(data_new,'ward','euclidean');
dendrogram(z1);
subplot(2,2,3);
y2 = pdist(data_new);
z2 = linkage(data_new,'average','euclidean');
dendrogram(z2);
subplot(2,2,4);
c = cluster(z2,'maxclust',4);
scatter3(data_new(:,1),data_new(:,2),data_new(:,3),10,c);



