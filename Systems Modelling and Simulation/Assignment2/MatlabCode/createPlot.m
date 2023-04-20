function ps = createPlot(t, X, xCap, a, aCap, b, bCap)
    error = X -xCap;
    errorA = aCap - a;
    errorB = bCap - b;

    figure(1);
    plot(t,X);
    hold on;
    plot(t,xCap);
    title("'X' and 'Estimated X' Comparison");
    legend({'Actual X', 'Estimated X'}, 'FontSize', 14);
    xlabel("Time in secs");
    ylabel("X value");

    figure(2);
    plot(t,error);
    title("Error between 'X' and 'Estimated X'");
    xlabel("Time in secs");
    ylabel("Error value");

    aline = a*ones(size(aCap));
    figure(3);
    plot(t,aline);
    hold on;
    plot(t,aCap);
    title("'a' and 'Estimated a' Comparison");
    legend({'Actual a', 'Estimated a'}, 'FontSize', 14);
    xlabel("Time in secs");
    ylabel("a value");
    %ylim([2.8 4.1]);

    figure(4);
    plot(t,errorA);
    title("Error between 'a' and 'Estimated a'");
    xlabel("Time in secs");
    ylabel("Error value");

    bline = b*ones(size(bCap));
    figure(5);
    plot(t,bline);
    hold on;
    plot(t,bCap);
    title("'b' and 'Estimated b' Comparison");
    legend({'Actual b', 'Estimated b'}, 'FontSize', 14);
    xlabel("Time in secs");
    ylabel("b value");

    figure(6);
    plot(t,errorB);
    title("Error between 'b' and 'Estimated b'");
    xlabel("Time in secs");
    ylabel("Error value");

end

