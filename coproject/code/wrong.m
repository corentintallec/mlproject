close all;
clear all;

idx = [247, 321, 340, 381, 445, 448, 495, 582, 684, 720, 740, 882, 947, 951, 956, 1014, 1039, 1044, 1112, 1226, 1232, 1242, 1247, 1299, 1319, 1328, 1378, 1393, 1500, 1522, 1530, 1549, 1553, 1581, 1681, 1709, 1754, 1790, 1901, 2035, 2044, 2070, 2098, 2109, 2118, 2129, 2130, 2135, 2182, 2185, 2272, 2293, 2371, 2387, 2422, 2488, 2597, 2607, 2648, 2654, 2863, 2896, 2927, 2939, 2953, 3060, 3073, 3117, 3289, 3333, 3422, 3475, 3503, 3520, 3558, 3559, 3597, 3767, 3776, 3780, 3796, 3808, 3853, 3906, 3941, 3976, 4065, 4075, 4078, 4163, 4176, 4199, 4201, 4248, 4289, 4443, 4497, 4500, 4639, 4740, 4807, 4823, 4880, 4966, 5457, 5642, 5734, 5887, 5936, 5937, 5955, 5973, 6035, 6059, 6166, 6555, 6560, 6571, 6576, 6597, 6625, 6651, 7434, 8094, 8527, 9009, 9015, 9024, 9587, 9634, 9642, 9664, 9692, 9729, 9745, 9749, 9768, 9770, 9779, 9792, 9808, 9839, 9944];
pred = [2, 7, 3, 7, 0, 8, 0, 2, 3, 8, 9, 7, 9, 4, 2, 5, 9, 8, 6, 2, 4, 9, 5, 7, 3, 9, 6, 3, 1, 9, 7, 6, 3, 9, 7, 3, 2, 7, 4, 3, 7, 9, 0, 4, 0, 2, 9, 1, 2, 5, 0, 6, 9, 1, 4, 4, 3, 2, 0, 1, 4, 0, 2, 5, 5, 7, 2, 9, 9, 9, 0, 7, 1, 4, 0, 5, 3, 2, 8, 6, 8, 8, 5, 3, 6, 1, 2, 3, 3, 0, 7, 9, 7, 8, 7, 2, 7, 1, 9, 5, 3, 4, 8, 4, 8, 5, 7, 2, 9, 3, 8, 8, 0, 9, 3, 9, 3, 7, 1, 7, 4, 5, 8, 8, 9, 2, 2, 2, 4, 8, 7, 7, 7, 6, 2, 6, 0, 0, 0, 9, 4, 7, 8];
truth = [4, 2, 5, 3, 6, 9, 8, 8, 7, 5, 4, 9, 8, 5, 1, 6, 7, 6, 4, 7, 9, 4, 9, 5, 8, 7, 5, 5, 7, 7, 8, 4, 9, 7, 3, 9, 7, 2, 9, 5, 2, 7, 2, 3, 6, 9, 4, 6, 1, 0, 8, 9, 4, 9, 6, 2, 5, 7, 9, 6, 9, 8, 3, 9, 3, 9, 1, 5, 8, 7, 6, 3, 9, 6, 5, 8, 9, 7, 5, 4, 2, 7, 6, 1, 4, 7, 0, 8, 9, 9, 2, 7, 1, 2, 2, 3, 8, 9, 8, 3, 8, 9, 0, 7, 1, 1, 3, 7, 4, 5, 3, 3, 2, 3, 9, 8, 9, 9, 7, 0, 8, 0, 4, 2, 4, 7, 7, 7, 9, 0, 9, 2, 9, 5, 4, 5, 2, 5, 2, 4, 9, 2, 3];

images = loadMNISTImages('data/t10k-images-idx3-ubyte');

figure()
rnd = randi(length(idx),15);
for i=1:15
    subplot(3,5,i)
    imshow(reshape(images(:,idx(rnd(i))+1),[28,28]))
    title([num2str(truth(rnd(i))),' -> ', num2str(pred(rnd(i)))])
end