function data_fin = selectData(data_2D, sp_2D, gbest, N_sp, D)
    
    N_p = size(data_2D, 1);          % Number of samples (rows) in the data
    data_fin = zeros(N_p, D);        % Preallocate the final data matrix with the selected bands
    
    % Loop through each subgroup (or cluster)
    for i = 1:N_sp 
        % Find the indices of the samples that belong to the current superpixel
        sp_index = find(sp_2D == i);
        
        % Extract the data corresponding to the current superpixel
        data_sub = data_2D(sp_index, :);
        
        % Sort the bands (features) in the order determined by the global best position
        [~, s_index] = sort(gbest(i, :));
        
        % Select the top D bands (features) based on the sorted global best position
        selectbands = s_index(1:D);
        
        % Assign the selected bands to the corresponding rows in the final data matrix
        data_fin(sp_index, :) = data_sub(:, selectbands);
    end
end
