function ang = culAng(xa, ya, xb, yb)
    dx = xb - xa;
    dy = yb - ya;
    d = 1e-5;

    if abs(dx) < d
        if abs(dy) < d
            ang = 0;
        elseif dy > 0
            ang = pi / 2;
        else
            ang = 3 * pi / 2;
        end
    else
        if dx > 0
            ang = atan(dy / dx);
        else
            ang = atan(dy / dx) ;
        end
    end

    % Convert radians to degrees
    ang = rad2deg(ang);

    if ang < 0
        ang = ang + 360;
    end

    if ang >= 360
        ang = ang - 360;
    end
end

% Helper function to convert radians to degrees
function deg = rad2deg(rad)
    deg = rad * (180 / pi);
end
