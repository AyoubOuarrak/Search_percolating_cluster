function[RACS] = calculate_RACS()

  %****************************************
  %  Calculate RACS for different values of L
  %****************************************
  xx = [];
  totRACS= [];
  avgRACS1 = [];
  avgRACS2 = [];
  avgRACS3 = [];
  avgRACS4 = [];
  for i = 0.1 : 0.04 : 09  %probability
    for j = 1 : 10  %different attempts 
      [found clusters] = cluster_finding(100, i);
      clusters(clusters == max(clusters)) = [];
      RACS = sum(clusters.^2) / sum(clusters);
      totRACS = [totRACS mean(RACS)];
    end
    avgRACS1 = [avgRACS1 mean(totRACS)];
    totRACS = [];
    xx = [xx (i)];
    
    for j = 1 : 5
      [found clusters] = cluster_finding(200, i);
      clusters(clusters == max(clusters)) = [];
      RACS = sum(clusters.^2) / sum(clusters);
      totRACS = [totRACS mean(RACS)];
    end
    avgRACS2 = [avgRACS2 mean(totRACS)];
    totRACS = [];
    
    for j = 1 : 4
      [found clusters] = cluster_finding(400, i);
      clusters(clusters == max(clusters)) = [];
      RACS = sum(clusters.^2) / sum(clusters);
      totRACS = [totRACS mean(RACS)];
    end
    avgRACS3 = [avgRACS3 mean(totRACS)];
    totRACS = [];
    
    for j = 1 : 2
      [found clusters] = cluster_finding(600, i);
      clusters(clusters == max(clusters)) = [];
      RACS = sum(clusters.^2) / sum(clusters);
      totRACS = [totRACS mean(RACS)];
    end
    avgRACS4 = [avgRACS4 mean(totRACS)];
    totRACS = [];
  end
  
  plot(xx, avgRACS1, xx, avgRACS2,xx, avgRACS3, xx, avgRACS4);
  xlabel('Probability');
  ylabel('Cluster sizes');
  title('Reduced Average Cluster Size');
  legend('L = 100', 'L = 200', 'L = 400', 'L = 600'); 
  axis([0.2 0.8 0 2500]);
end
