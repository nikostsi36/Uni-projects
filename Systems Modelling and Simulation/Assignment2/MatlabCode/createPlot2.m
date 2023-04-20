function ps = createPlot2(t, val, valCap, name)

    if size(val)==1
        newVal = val*ones(size(valCap));
    else
        newVal = val;
    end

    error = newVal -valCap;

    figure();
    plot(t,newVal);
    hold on;
    plot(t,valCap);
    title(sprintf("'%s' and 'Estimated %s' Comparison",name,name));
    leg1 = sprintf("Actual '%s'",name);
    leg2 = sprintf("Estimated '%s'",name);
    legend(leg1, leg2);
    xlabel("Time in secs");
    ylabel("X value");

    figure();
    plot(t,error);
    title(sprintf("Error between '%s' and 'Estimated %s'", name,name));
    xlabel("Time in secs");
    ylabel("Error value");
