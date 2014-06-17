function [found size clusters]= cluster_finding(N, p)
  % found : boolean value that say if we found the cluster
  % size : array that contain the size of clusters
  % clusters : return the clusters tha we found
	 
  % N : order matrix to generate
  % p : probablity to find a colored site
	 
  % generate a matrix with values between 0 and 1
  randMatrix = rand(N);
  % coloring the site with probability p
  M = zeros(N);
  M(randMatrix < p) = 1;
  
  clusters = zeros(N);
  size = [];
  stack = zeros(1, N^2);
  label = 0;
  found = 0;
  
  for i = 1 : N^2
    if(M(i) && clusters(i) == 0)
      label = label + 1;
      stack(1) = i;
      clusters(i) = label;
      bottom = 1;
      top = 1;
      
      while bottom <= top
        current = stack(bottom);
        if(current > N && M(current - N) && clusters(current -N) == 0)
          top = top +1;
          stack(top) = current - N;
          clusters(stack(top)) = label;
        end
        
        if(current < (N^2 - N +1) && M(current +N) && clusters(current +N) == 0)
          top = top +1;
          stack(top) = current + N;
          clusters(stack(top)) = label;
        end
        
        if(mod(current, N) && M(current + 1) && clusters(current + 1) == 0)
          top = top + 1;
          stack(top) = current + 1;
          clusters(stack(top)) = label;
        end
        
        if(mod(current, N)~=1 && M(current - 1) && clusters(current -1) == 0)
          top = top + 1;
          stack(top) = current - 1;
          clusters(stack(top)) = label;
        end
        bottom = bottom + 1;
      end %while 
      size(label) = top;
    end % if 
    
    if (i == N)
      if(length(find(clusters(:, N))) > 0)
        found = 1;
      end
    %  if nargout == 1
        %return
      %end
      
    end
    
  end 
end
