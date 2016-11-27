N=128;
tick_res=N/16;
tick_start=-N/2+1;
tick_end=N/2;
m=eye(N);
imagesc(m)
ytick=[1:tick_res:N-1 N];
hax=gca();
%set(hax, "XTickLabel", [0 0 1 1])


set(hax, "ytick", ytick);
set(hax, "YTickLabel", [tick_end:-tick_res:tick_start tick_start ]);
%set(hax, "ydir", "reverse");

