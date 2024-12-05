function UACI_value = uaci(after_change, before_change)
    % Convert images to double for accurate calculations
    after_change = double(after_change);
    before_change = double(before_change);
    
    % Calculate absolute difference and normalize
    AB = abs(before_change - after_change);
    
    % Calculate UACI
    UACI_value = sum(AB(:)) / (255 * numel(before_change)) * 100;
end
