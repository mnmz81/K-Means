function [centroids,MinDisPoints] = MyKmeans(X,k, maxIters)

[m,n] = size(X);
%choose random k initial centroids
idx= randperm(m);
centroids = X(idx(1:k),:);
%loop of algorithm
for i=1:maxIters
    %find the closest centroid for each point
    MinDisPoints = zeros(m,1);
    for j=1:m
        minimum_distance = Inf; %lowest distance for a point
        MinDisPoints(j) = 0; 
        for k=1:k
            distance = norm(X(j,:)-centroids(k,:)); %calculation distance  to each centroid
            if(distance < minimum_distance) %to check if we find a new centroid
                minimum_distance = distance;
                MinDisPoints(j) = k;
            end
        end
    end
     %to fix the centroid 
      for j=1:k
          cur_clusters = X(MinDisPoints==j,:);
          centroids(j,:) = [sum(cur_clusters(:,1)) sum(cur_clusters(:,2))] / size(cur_clusters,1);
      end
end

end

