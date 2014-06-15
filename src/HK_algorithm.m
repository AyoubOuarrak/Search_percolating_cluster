function [found sizes clusters] = HK_algorithm(N, p) 
  % found : boolean value that say if we found the percolator cluster
  % size : integer value that contain the number of clusters
  % clusters : return the clusters that we found
	 
  % N : order matrix to generate
  % p : probablity to find a colored site
	 
  % generate a matrix with values between 0 and 1
  randMatrix = rand(N);
  % coloring the site with probability p
  Matrix = zeros(N);
  Matrix(randMatrix < p) = 1;
  
  labels = [];
  totLabels = 0;
  found = 0;
  N = size(Matrix);
  
  for i = 1 : N
    for j = 1 : N
      % site(i,j) colored 
      if(Matrix(i, j) == 1)
        up = 0;
        left = 0;
        
        if( i > 1)
          up = Matrix(i-1, j);
        end
        
        if(j > 1)
          left = Matrix(i, j-1);
        end
        
        switch((up > 0) + (left > 0))
          %new cluster
          case 0
            totLabels = totLabels + 1;
            labels(totLabels) = totLabels;
            Matrix(i, j) = totLabels;
            
          %same cluster
          case 1
            Matrix(i, j) = up + left;
            
          %different cluster
          case 2
            while labels(up) < up
              up = labels(up);
            end
            
            while labels(left) < left
              left = labels(left);
            end
            Matrix(i, j) = min([up left]);
            labels(max([up left])) = min([up left]);
        end % switch
      end %  if 
    end % for
  end % for
  
  %renaming labels array
  j = 1;
  for i = 1 : totLabels
    if(labels(i) == i)
      labels(i) = j;
      j = j +1;
    else
      labels(i) = labels(labels(i));
    end
  end
  
  %apply the labels array to the matrix
  for i = 1 : N
    for j = 1 : N
      if(Matrix(i, j) ~= 0)
        Matrix(i, j) = labels(Matrix(i, j));
      end
    end
  end
  
  sizes = [];
  for i = 1 : max(labels)
    sizes = [sizes length(find(Matrix == i))];
  end
  
  % find cluster 
  count = 0;
  
  for i = 1 : max(labels)
    for j = 1 : N
      if(~isempty(find(Matrix(:, j) == i, 1)))
        count = count + 1;
      end
      if(count == N)
        found = 1;
        clusters = Matrix;
        return;
      end
    end
    count = 0;
  end      
end
