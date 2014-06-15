function res = error_probability(N, attempts)
  avgP1 = [];
  avgP2 = [];
  avgP3 = [];
  percolation = [];
  avgPercolation = [];
  err = [];
  x = [];
  
  for p = 0.3 : 0.01 : 1
    for i = 1 : 10
      for j = 1 : attempts / 10
        percolation = [percolation cluster_finding(N, p)];
      end
      avgPercolation = [avgPercolation mean(percolation)];
    end
    err = [err sum(var(avgPercolation))/sqrt(10)];
    avgPercolation = [];
    x = [x p];
  end
  res = mean(err);
  plot(x, err);
  title('Error critical threshold');
  xlabel('Porbability');
end
