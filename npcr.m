function NPCR = npcr(image, enc)
    % Convert images to logical for comparison
    diff = image ~= enc;
    
    % Count the number of differing pixels
    differing_pixels = sum(diff(:));
    
    % Calculate NPCR
    NPCR = (differing_pixels / numel(image)) * 100;
end
