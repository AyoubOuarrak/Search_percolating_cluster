function res = percolation()
    %************************************************
    % Calculate for different values of L the p1, p2, p3
    %************************************************
    p1 = [];
    p2 = [];
    p3 = [];
    p4 = [];
    p5 = [];
    p6 = [];
    p7 = [];
    p8 = [];
    p9 = [];
    p10 = [];
    p11 = [];
    p12 = [];
    x = 0.3 : 0.01 : 1;
    
    [p1 p2 p3] = probability_max_cluster(200, 10);
    [p4 p5 p6] = probability_max_cluster(400, 10);
    [p7 p8 p9] = probability_max_cluster(600, 10);
    [p10 p11 p12] = probability_max_cluster(800, 10);
    
    subplot(3, 1, 1), plot(x, p1, x, p4, x, p7, x, p10);
    title('P1');
    xlabel('Probability');
    axis([0.3 0.9 0 1]);
    legend('L = 200', 'L = 400', 'L = 600', 'L = 800', 'attempts = 10');
    subplot(3, 1, 2), plot(x, p2, x, p5, x, p8, x, p11);
    title('P2');
    xlabel('Probability');
    axis([0.3 0.9 0 1]);
    legend('L = 200', 'L = 400', 'L = 600', 'L = 800', 'attempts = 10');
    subplot(3, 1, 3), plot(x, p3, x, p6, x, p9, x, p12);
    title('P3');
    xlabel('Probability');
    axis([0.3 0.9 0 1]);
    legend('L = 200', 'L = 400', 'L = 600', 'L = 800', 'attempts = 10');
end