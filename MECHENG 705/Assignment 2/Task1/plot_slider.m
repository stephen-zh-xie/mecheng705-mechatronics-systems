figure;
subplot(2, 1, 1);
plot(out.Position);
title("Position vs Time");
xlabel("Time (s)");
ylabel("Position (m)");

subplot(2, 1, 2);
plot(out.Velocity);
title("Velocity vs Time");
xlabel("Time (s)");
ylabel("Velocity (m/s)");