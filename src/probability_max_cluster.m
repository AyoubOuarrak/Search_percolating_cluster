function [p1 p2 p3] = probability_max_cluster(N, attempts)
  % p1 : Smax / N^2
  % p2 : Smax / N^2*P
  % p3 : Smax / sum(sns)
  p1 = zeros(1, attempts);
  p2 = zeros(1, attempts);
  p3 = zeros(1, attempts);
  avgP1 = [];
  avgP2 = [];
  avgP3 = [];
  for p = 0.3 : 0.01 : 1
    for i = 1 : attempts
      [found clusters] =  cluster_finding(N, p);
      
      p1(i) = (max(clusters) / N^2);
      p2(i) = (max(clusters) / (N^2)*p);
      p3(i) = (max(clusters) / sum(clusters));
    end
    avgP1 = [avgP1 mean(p1)];
    avgP2 = [avgP2 mean(p2)];
    avgP3 = [avgP3 mean(p3)];
    
    p1  = zeros(1, attempts);
    p2 = zeros(1, attempts);
    p3 = zeros(1, attempts);
  end
  p1 = avgP1;
  p2 = avgP2;
  p3 = avgP3;
end
