gl = [0.0, 0.1, 0.2, 50.0]
gb = [-0.9, 0.1, 5.2, 6.2]
dis = [1.1, 1.1, 2.1, 3.1]
ebv=getebv(gl,gb,dis=dis)
print,ebv

ebv=getebv(gl,gb)
print,ebv
end
