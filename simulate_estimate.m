function simulate_estimate(topdir, ze, ka, i)
    %% Add path to HGF toolbox
    addpath(genpath('tapas/HGF'));
    
    %% Load inputs
    u = load('tapas/HGF/example_binary_input.txt');
    
    %% Simulate
    sim = tapas_simModel(u, 'tapas_hgf_binary', [NaN 0 1 NaN 1 1 NaN 0 0 NaN ka NaN -4 -6], 'tapas_unitsq_sgm', ze);
    
    %% Estimate
    est = tapas_fitModel(sim.y, sim.u, 'tapas_hgf_binary_config', 'tapas_unitsq_sgm_config');
    
    %% Extract estimated kappa and write it to text file
    estka = est.p_prc.ka(2);
    fn = [topdir '/' num2str(ze) '/' num2str(ka) '/ka' num2str(i)];
    fh = fopen(fn, 'w');
    fprintf(fh, '%5.4f\n', estka);
    fclose(fh);
end
