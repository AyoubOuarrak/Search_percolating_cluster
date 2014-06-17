function [sizes perc] = Cluster_finding_HK(L, p)

  %sizes : array that contain the size of clusters
  %perc : return the clusters tha we found
  function root = LabelOfLabel(label)        
    z = label;
    while clusters(z) < 0
      z = abs(clusters(z));
      clusters;
      ret;
    end
    root = z;   
  end
  
  % generate a matrix with values between 0 and 1
  randMatrix = rand(L);
  % coloring the site with probability p
  ret = zeros(L);
  ret(randMatrix < p) = 1;
  cluster_map = zeros(L, L); % matrix of cluster's label

  % generate matrix with value between 0 and L^2-1
  nn_u = reshape([0: L^2-1], L, L);
  nn_u(1, :) = -1*ones(1, L);

  % generate matrix with value between 2 and L^2+1
  nn_d = reshape([2: L^2+1], L, L);
  nn_d(L, :) = -1*ones(1, L);

  % generate matrix with value between 1-L and L^2-L
  nn_l = reshape([1-L: L^2-L], L, L);
  nn_l(:, 1) = -1*ones(L, 1);

  % generate matrix with value between 1+L and L^2+L
  nn_r = reshape([1+L: L^2+L], L, L);
  nn_r(:, L) = -1*ones(L, 1);
  
  
  clusters = [];
  label_counter = 1;
  for i = 1 : L^2
    if ret(i) == 1
      % control if the left site un the up site are full and with different label
      if nn_u(i) ~= -1 && nn_l(i) ~= -1 && ...
      cluster_map(nn_l(i)) ~= 0 && cluster_map(nn_u(i)) ~= 0 && cluster_map(nn_l(i)) ~= cluster_map(nn_u(i))
        minLabel = min(cluster_map(nn_u(i)), cluster_map(nn_l(i)));
        maxLabel = max(cluster_map(nn_u(i)), cluster_map(nn_l(i)));
        cluster_map(i) = minLabel;
        x = LabelOfLabel(minLabel);
        y = LabelOfLabel(maxLabel);
        if x ~= y
          clusters(x) = clusters(x) + clusters(y) + 1;
          clusters(y) = (-1) * minLabel;
        else
          clusters(x) = clusters(x) + 1;
        end
      % control left site
      elseif nn_l(i) ~= -1 && ...
      cluster_map(nn_l(i)) ~= 0

        cluster_map(i) = cluster_map(nn_l(i));
        x = LabelOfLabel(cluster_map(nn_l(i)));
        clusters(x) = clusters(x) + 1;

      % control up site
      elseif nn_u(i) ~= -1 && ...
      cluster_map(nn_u(i)) ~= 0

        cluster_map(i) = cluster_map(nn_u(i));
        x = LabelOfLabel(cluster_map(nn_u(i)));
        clusters(x) = clusters(x) + 1;	

      % new cluster   	
      else
        cluster_map(i) = label_counter;
        clusters(label_counter) = 1;
        label_counter = label_counter + 1;
      end
    end
  end
  
  vv = find(clusters > 0);
  sizes = clusters(vv);

  % relabeling
  for i = 1 : L
    if cluster_map(i, 1) ~= 0
      cluster_map(i, 1) = LabelOfLabel(cluster_map(i, 1));
    end

    if cluster_map(i, L) ~= 0
      cluster_map(i, L) = LabelOfLabel(cluster_map(i, L));
    end
  end


  perc = setdiff(intersect(cluster_map(:, 1), cluster_map(:, L)), 0);
end







