%% Q4
clc;clear;
%% A
data = load('faithful.txt');
figure(1)
plot(data(:,1) , data(:,2) , 'rx');
xlabel('Duration of minutes of the eruption');
ylabel('Time to next eruption (minutes)');
title("faithful gaizer");
%% B
figure(2)
k=2;
max_iters = 100;
%the algorithm
[centroids, minDisPoints] = MyKmeans(data,k,max_iters);
%plot each groop  with a different color
hold on
colors = ['r' 'g' 'b'];
plot(centroids(:,1), centroids(:,2), 'bo','MarkerSize',6);
X = data(:,1);
y = data(:,2);
for i=1:k
    plot(X(minDisPoints==i), y(minDisPoints==i), strcat(colors(i),'*'),'MarkerSize',2);
end
hold off