local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
pcy = Tunnel.getInterface("ve_rotas")
-----------------------------------------------------------------------------------------------------------------------------------------
-- VARIAVEIS
-----------------------------------------------------------------------------------------------------------------------------------------
local blips = false
local service = false
local selecionado = 0
local processo = false
local segundos = 0
-----------------------------------------------------------------------------------------------------------------------------------------
-- RESIDENCIAS
-----------------------------------------------------------------------------------------------------------------------------------------
local locs = {
    [1] = {['x'] = 774.43, ['y'] = -2474.92, ['z'] = 20.15}, -- ROTA TRIADE
    [2] = {['x'] = 1095.54, ['y'] = -2159.41, ['z'] = 31.32},
    [3] = {['x'] = 1316.15, ['y'] = -1526.77, ['z'] = 51.81},
    [4] = {['x'] = 1154.1, ['y'] = -785.48, ['z'] = 57.6},
    [5] = {['x'] = 999.99, ['y'] = -98.48, ['z'] = 74.18},
    [6] = {['x'] = 223.24, ['y'] = -8.36, ['z'] = 73.79},
    [7] = {['x'] = 190.07, ['y'] = 308.68, ['z'] = 105.4},
    [8] = {['x'] = -561.26, ['y'] = 403.05, ['z'] = 101.82},
    [9] = {['x'] = -933.31, ['y'] = 404.67, ['z'] = 79.15},
    [10] = {['x'] = -2016.54, ['y'] = 559.33, ['z'] = 108.3},
    [11] = {['x'] = -2282.1, ['y'] = 361.36, ['z'] = 174.61},
    [12] = {['x'] = -1703.89, ['y'] = -441.07, ['z'] = 41.66},
    [13] = {['x'] = -1337.22, ['y'] = -1161.81, ['z'] = 4.52},
    [14] = {['x'] = -696.17, ['y'] = -1143.42, ['z'] = 10.84},
    [15] = {['x'] = -1164.92, ['y'] = -2022.69, ['z'] = 13.17},
    [16] = {['x'] = -735.77, ['y'] = -2276.69, ['z'] = 13.44},
    [17] = {['x'] = -58.46, ['y'] = -2245.02, ['z'] = 8.96},
    [18] = {['x'] = 172.61, ['y'] = -1668.38, ['z'] = 29.74},
    [19] = {['x'] = 722.85, ['y'] = -2016.49, ['z'] = 29.3},
    [20] = {['x'] = 660.37, ['y'] = -2812.84, ['z'] = 6.14},

    [21] = {['x'] = 1450.67, ['y'] = -1720.8, ['z'] = 68.7}, -- ROTA SICILIANA
    [22] = {['x'] = 1223.78, ['y'] = -1468.49, ['z'] = 34.85},
    [23] = {['x'] = 1082.69, ['y'] = -787.45, ['z'] = 58.36},
    [24] = {['x'] = 1199.68, ['y'] = -501.4, ['z'] = 65.18},
    [25] = {['x'] = 456.3, ['y'] = 130.66, ['z'] = 99.31},
    [26] = {['x'] = -354.94, ['y'] = 212.81, ['z'] = 86.69},
    [27] = {['x'] = -1334.53, ['y'] = -338.47, ['z'] = 36.69},
    [28] = {['x'] = -2205.75, ['y'] = -373.76, ['z'] = 13.33},
    [29] = {['x'] = -3031.44, ['y'] = 92.37, ['z'] = 12.35},
    [30] = {['x'] = -3275.67, ['y'] = 964.6, ['z'] = 8.35},
    [31] = {['x'] = -2797.87, ['y'] = 1431.39, ['z'] = 100.93},
    [32] = {['x'] = -1928.38, ['y'] = 1779.53, ['z'] = 173.02},
    [33] = {['x'] = -2544.07, ['y'] = 2315.98, ['z'] = 33.22},
    [34] = {['x'] = -2186.75, ['y'] = 4249.97, ['z'] = 48.95},
    [35] = {['x'] = -1490.42, ['y'] = 4981.41, ['z'] = 63.36},
    [36] = {['x'] = -3187.32, ['y'] = 1273.78, ['z'] = 12.68},
    [37] = {['x'] = -2961.43, ['y'] = 377.01, ['z'] = 15.01},
    [38] = {['x'] = -1840.55, ['y'] = -649.03, ['z'] = 10.54},
    [39] = {['x'] = -1143.26, ['y'] = -1616.51, ['z'] = 4.42},
    [40] = {['x'] = 999.34, ['y'] = -1785.18, ['z'] = 32.48},

    [41] = {['x'] = 2512.58, ['y'] = -317.66, ['z'] = 93.0}, -- ROTA CRIPS
    [42] = {['x'] = 2461.54, ['y'] = 1575.81, ['z'] = 33.12},
    [43] = {['x'] = 1692.41, ['y'] = 3294.49, ['z'] = 41.15},
    [44] = {['x'] = 2389.65, ['y'] = 5025.94, ['z'] = 46.04},
    [45] = {['x'] = 1469.79, ['y'] = 6550.34, ['z'] = 14.91},
    [46] = {['x'] = -435.53, ['y'] = 6154.6, ['z'] = 31.48},
    [47] = {['x'] = -2188.23, ['y'] = 4254.11, ['z'] = 48.95},
    [48] = {['x'] = -2566.11, ['y'] = 2307.26, ['z'] = 33.22},
    [49] = {['x'] = -1502.74, ['y'] = 1521.72, ['z'] = 115.29},
    [50] = {['x'] = -2797.7, ['y'] = 1431.79, ['z'] = 100.93},
    [51] = {['x'] = -2194.11, ['y'] = -388.54, ['z'] = 13.48},
    [52] = {['x'] = -2301.8, ['y'] = 299.66, ['z'] = 169.61},
    [53] = {['x'] = -1064.95, ['y'] = 772.1, ['z'] = 170.06},
    [54] = {['x'] = -505.3, ['y'] = -442.75, ['z'] = 34.49},
    [55] = {['x'] = -306.49, ['y'] = -2191.67, ['z'] = 10.84},
    [56] = {['x'] = 2.84, ['y'] = -713.44, ['z'] = 32.49},
    [57] = {['x'] = 231.57, ['y'] = -1752.71, ['z'] = 28.99},
    [58] = {['x'] = 1656.33, ['y'] = -1842.35, ['z'] = 109.24},
    [59] = {['x'] = 646.73, ['y'] = -3017.96, ['z'] = 7.34},
    [60] = {['x'] = 1162.5, ['y'] = -1410.37, ['z'] = 34.89},

    [61] = { ['x'] = -2213.38, ['y'] = -371.03, ['z'] = 13.33}, -- ROTA BLOODS
    [62] = { ['x'] = -3195.69, ['y'] = 1221.51, ['z'] = 10.05},
    [63] = { ['x'] = -1928.38, ['y'] = 1779.41, ['z'] = 173.1},
    [64] = { ['x'] = -1512.65, ['y'] = 1517.46, ['z'] = 115.29},
    [65] = { ['x'] = -1337.03, ['y'] = 606.18, ['z'] = 134.38},
    [66] = { ['x'] = 232.39, ['y'] = 672.29, ['z'] = 189.98},
    [67] = { ['x'] = -263.73, ['y'] = -959.71, ['z'] = 31.23},
    [68] = { ['x'] = 877.4, ['y'] = -2043.34, ['z'] = 31.59},
    [69] = { ['x'] = 386.21, ['y'] = -324.9, ['z'] = 46.87},
    [70] = { ['x'] = -1543.04, ['y'] = -248.96, ['z'] = 48.29},
    [71] = { ['x'] = -322.23, ['y'] = -1545.7, ['z'] = 31.02},
    [72] = { ['x'] = 895.94, ['y'] = -895.93, ['z'] = 27.8},
    [73] = { ['x'] = -458.17, ['y'] = -2266.11, ['z'] = 8.52},
    [74] = { ['x'] = -1277.7, ['y'] = -3428.97, ['z'] = 13.95},
    [75] = { ['x'] = -721.67, ['y'] = -1513.74, ['z'] = 5.01},
    [76] = { ['x'] = 474.33, ['y'] = -635.72, ['z'] = 25.65},
    [77] = { ['x'] = 660.37, ['y'] = 593.31, ['z'] = 129.25},
    [78] = { ['x'] = -344.81, ['y'] = -822.14, ['z'] = 31.56},
    [79] = { ['x'] = -2226.96, ['y'] = 338.25, ['z'] = 174.61},
    [80] = { ['x'] = -1312.0, ['y'] = -1337.0, ['z'] = 4.64},

    [81] = {['x'] = -297.38, ['y'] = -1332.31, ['z'] = 30.87}, -- ROTA BENNYS
    [82] = {['x'] = -428.97, ['y'] = -1728.08, ['z'] = 19.79},
    [83] = {['x'] = -41.11, ['y'] = -1675.11, ['z'] = 29.02},
    [84] = {['x'] = 215.9, ['y'] = -1389.47, ['z'] = 30.16},
    [85] = {['x'] = 788.29, ['y'] = -1770.18, ['z'] = 28.87},
    [86] = {['x'] = 264.04, ['y'] = -2506.79, ['z'] = 6.01},
    [87] = {['x'] = -43.98, ['y'] = -2519.93, ['z'] = 7.4},
    [88] = {['x'] = 557.2, ['y'] = -2716.49, ['z'] = 7.12},
    [89] = {['x'] = 858.32, ['y'] = -2496.89, ['z'] = 28.32},
    [90] = {['x'] = 1384.11, ['y'] = -2079.74, ['z'] = 52.21},
    [91] = {['x'] = 1191.96, ['y'] = -1268.19, ['z'] = 35.17},
    [92] = {['x'] = 1139.42, ['y'] = -463.81, ['z'] = 66.87},
    [93] = {['x'] = 401.79, ['y'] = -339.63, ['z'] = 46.98},
    [94] = {['x'] = -344.88, ['y'] = -175.76, ['z'] = 38.69},
    [95] = {['x'] = -967.61, ['y'] = -267.48, ['z'] = 39.02},
    [96] = {['x'] = -1011.59, ['y'] = -480.08, ['z'] = 39.98},
    [97] = {['x'] = -822.68, ['y'] = -1099.79, ['z'] = 10.92},
    [98] = {['x'] = -700.46, ['y'] = -1401.48, ['z'] = 5.5},
    [99] = {['x'] = -621.08, ['y'] = -1640.25, ['z'] = 26.14},
    [100] = {['x'] = -398.71, ['y'] = -1885.62, ['z'] = 21.54},

    [101] = {['x'] = -1336.32, ['y'] = -407.25, ['z'] = 36.51}, -- ROTA Bahamas
    [102] = {['x'] = -1200.22, ['y'] = -156.26, ['z'] = 40.1},
    [103] = {['x'] = 461.82, ['y'] = -277.29, ['z'] = 48.71},
    [103] = {['x'] = 1083.44, ['y'] = -351.63, ['z'] = 67.1},
    [104] = {['x'] = 1043.62, ['y'] = 190.35, ['z'] = 81.0},
    [105] = {['x'] = 2601.16, ['y'] = 2804.09, ['z'] = 33.83},
    [106] = {['x'] = 2741.96, ['y'] = 4412.74, ['z'] = 48.63},
    [107] = {['x'] = 1705.99, ['y'] = 6425.56, ['z'] = 32.77},
    [108] = {['x'] = -162.43, ['y'] = 6189.51, ['z'] = 31.44},
    [109] = {['x'] = -2218.6, ['y'] = 4229.55, ['z'] = 47.4},
    [110] = {['x'] = -3147.19, ['y'] = 1121.29, ['z'] = 20.87},
    [111] = {['x'] = -1936.51, ['y'] = 580.61, ['z'] = 119.49},
    [112] = {['x'] = -904.67, ['y'] = 780.17, ['z'] = 186.45},
    [113] = {['x'] = 655.45, ['y'] = 588.7, ['z'] = 129.06},
    [114] = {['x'] = 756.31, ['y'] = -557.79, ['z'] = 33.65},
    [115] = {['x'] = 767.04, ['y'] = -1895.48, ['z'] = 29.09},
    [116] = {['x'] = 262.08, ['y'] = -1822.19, ['z'] = 26.88},
    [117] = {['x'] = -289.11, ['y'] = -1080.96, ['z'] = 23.03},
    [118] = {['x'] = -1378.03, ['y'] = -361.05, ['z'] = 36.62},

    [119] = {['x'] = -602.0, ['y'] = -347.46, ['z'] = 35.25}, -- ROTA LIFE INVADER
    [120] = {['x'] = -1286.07, ['y'] = -1386.67, ['z'] = 4.45},
    [121] = {['x'] = 5.82, ['y'] = -985.48, ['z'] = 29.36},
    [122] = {['x'] = 1230.94, ['y'] = -1083.36, ['z'] = 38.53},
    [123] = {['x'] = 1620.49, ['y'] = -2258.28, ['z'] = 106.68},
    [124] = {['x'] = -621.3, ['y'] = -1640.59, ['z'] = 25.98},
    [125] = {['x'] = 254.5, ['y'] = -1012.87, ['z'] = 29.27},
    [126] = {['x'] = 1533.06, ['y'] = 792.38, ['z'] = 77.55},
    [127] = {['x'] = 1531.12, ['y'] = 1727.9, ['z'] = 109.93},
    [128] = {['x'] = 46.36, ['y'] = 2789.05, ['z'] = 57.88},
    [129] = {['x'] = 1361.23, ['y'] = 3602.9, ['z'] = 34.95},
    [130] = {['x'] = 1258.7, ['y'] = 2739.79, ['z'] = 38.85},
    [131] = {['x'] = -42.28, ['y'] = 1883.37, ['z'] = 195.63},
    [132] = {['x'] = -681.38, ['y'] = 916.77, ['z'] = 232.12},
    [133] = {['x'] = -1305.59, ['y'] = 240.17, ['z'] = 58.99},
    [134] = {['x'] = -2066.58, ['y'] = -312.17, ['z'] = 13.26},
    [135] = {['x'] = 245.6, ['y'] = -677.46, ['z'] = 37.76},
    [136] = {['x'] = 561.15, ['y'] = 92.36, ['z'] = 96.06},
    [137] = {['x'] = -1197.25, ['y'] = -259.33, ['z'] = 37.76},
    [138] = {['x'] = -67.88, ['y'] = -205.93, ['z'] = 45.81},

    [139] = {['x'] = -602.0, ['y'] = -347.46, ['z'] = 35.25}, -- ROTA GALAXY
    [140] = {['x'] = -1286.07, ['y'] = -1386.67, ['z'] = 4.45},
    [141] = {['x'] = 5.82, ['y'] = -985.48, ['z'] = 29.36},
    [142] = {['x'] = 1230.94, ['y'] = -1083.36, ['z'] = 38.53},
    [143] = {['x'] = 1620.49, ['y'] = -2258.28, ['z'] = 106.68},
    [144] = {['x'] = -621.3, ['y'] = -1640.59, ['z'] = 25.98},
    [145] = {['x'] = 254.5, ['y'] = -1012.87, ['z'] = 29.27},
    [146] = {['x'] = 1533.06, ['y'] = 792.38, ['z'] = 77.55},
    [147] = {['x'] = 1531.12, ['y'] = 1727.9, ['z'] = 109.93},
    [148] = {['x'] = 46.36, ['y'] = 2789.05, ['z'] = 57.88},
    [149] = {['x'] = 1361.23, ['y'] = 3602.9, ['z'] = 34.95},
    [150] = {['x'] = 1258.7, ['y'] = 2739.79, ['z'] = 38.85},
    [151] = {['x'] = -42.28, ['y'] = 1883.37, ['z'] = 195.63},
    [152] = {['x'] = -681.38, ['y'] = 916.77, ['z'] = 232.12},
    [153] = {['x'] = -1305.59, ['y'] = 240.17, ['z'] = 58.99},
    [154] = {['x'] = -2066.58, ['y'] = -312.17, ['z'] = 13.26},
    [155] = {['x'] = 245.6, ['y'] = -677.46, ['z'] = 37.76},
    [156] = {['x'] = 561.15, ['y'] = 92.36, ['z'] = 96.06},
    [157] = {['x'] = -1197.25, ['y'] = -259.33, ['z'] = 37.76},
    [158] = {['x'] = -67.88, ['y'] = -205.93, ['z'] = 45.81},

    [159] = {['x'] = 996.56, ['y'] = 3575.57, ['z'] = 34.62}, -- ROTA Native
    [160] = {['x'] = 387.57, ['y'] = 3585.11, ['z'] = 33.3},
    [161] = {['x'] = 839.34, ['y'] = 2176.34, ['z'] = 52.29},
    [162] = {['x'] = 135.11, ['y'] = 323.04, ['z'] = 116.64},
    [163] = {['x'] = -617.8, ['y'] = 314.64, ['z'] = 82.26},
    [164] = {['x'] = -723.04, ['y'] = -1112.31, ['z'] = 10.66},
    [165] = {['x'] = -1307.8, ['y'] = -1317.47, ['z'] = 4.88},
    [166] = {['x'] = -345.52, ['y'] = 34.46, ['z'] = 47.86},
    [167] = {['x'] = -242.55, ['y'] = -812.66, ['z'] = 30.72},
    [168] = {['x'] = -169.45, ['y'] = -1027.72, ['z'] = 27.28},
    [169] = {['x'] = -81.52, ['y'] = -1326.28, ['z'] = 29.27},
    [170] = {['x'] = 47.92, ['y'] = -1594.01, ['z'] = 29.6},
    [171] = {['x'] = 499.5, ['y'] = -1963.86, ['z'] = 24.99},
    [172] = {['x'] = 110.71, ['y'] = -2566.38, ['z'] = 10.82},
    [173] = {['x'] = -185.14, ['y'] = -2509.48, ['z'] = 9.14},
    [174] = {['x'] = 853.59, ['y'] = -2207.42, ['z'] = 30.68},
    [175] = {['x'] = 1430.67, ['y'] = -2316.4, ['z'] = 66.88},
    [176] = {['x'] = 1737.85, ['y'] = -1474.49, ['z'] = 113.95},
    [177] = {['x'] = 2512.63, ['y'] = -317.61, ['z'] = 93.0},
    [178] = {['x'] = 1865.51, ['y'] = 3759.82, ['z'] = 33.0},

    [189] = {['x'] = 1360.63, ['y'] = 3603.7, ['z'] = 34.96}, -- ROTA Driftking
    [190] = {['x'] = 1776.5, ['y'] = 3327.16, ['z'] = 41.43},
    [191] = {['x'] = 2029.76, ['y'] = 3184.66, ['z'] = 45.18},
    [192] = {['x'] = 2296.42, ['y'] = 2945.31, ['z'] = 46.59},
    [193] = {['x'] = 1531.87, ['y'] = 816.8, ['z'] = 77.43},
    [194] = {['x'] = 548.9, ['y'] = -191.67, ['z'] = 54.49},
    [195] = {['x'] = 143.42, ['y'] = -280.44, ['z'] = 50.45},
    [196] = {['x'] = -128.62, ['y'] = -648.67, ['z'] = 40.51},
    [197] = {['x'] = -290.52, ['y'] = -819.17, ['z'] = 32.45},
    [198] = {['x'] = -304.66, ['y'] = -1178.43, ['z'] = 23.53},
    [199] = {['x'] = -324.29, ['y'] = -1356.39, ['z'] = 31.3},
    [200] = {['x'] = 8.37, ['y'] = -1600.19, ['z'] = 29.29},
    [201] = {['x'] = 374.35, ['y'] = -1267.28, ['z'] = 32.52},
    [202] = {['x'] = 488.0, ['y'] = -873.12, ['z'] = 25.39},
    [203] = {['x'] = 436.35, ['y'] = -647.16, ['z'] = 28.75},
    [204] = {['x'] = 143.57, ['y'] = -832.5, ['z'] = 31.18},
    [205] = {['x'] = 333.06, ['y'] = -995.77, ['z'] = 29.27},
    [206] = {['x'] = 1045.64, ['y'] = 192.54, ['z'] = 81.0},
    [207] = {['x'] = 2849.48, ['y'] = 3439.79, ['z'] = 50.89},
    [208] = {['x'] = 2848.82, ['y'] = 4449.89, ['z'] = 48.53},
}

local LocaisRotas = { -- Local em que se pega o início da rota e a permissão pra acessar o blip
    ['bloods.permissao'] =  {-1077.93,-1675.02,4.58},
    ['crips.permissao'] =  {1147.49,-1640.21,36.34},
    ['siciliana.permissao'] =  {1075.89,-1978.63,31.48},
    ['triade.permissao'] =  {573.81,-3124.14,18.77},
    ['bahamas.permissao'] =  {-1382.28,-633.6,30.82},
    ['lifeinvader.permissao'] =  {-1066.78,-243.74,44.03},
    ['bennys.permissao'] =  {-204.44,-1330.73,34.9},
    ['galaxy.permissao'] =  {-216.11,-288.3,25.46},
    ['native.permissao'] =  {1556.16,3523.38,36.13},
    ['driftking.permissao'] =  {102.84,6613.89,32.44}
}
-----------------------------------------------------------------------------------------------------------------------------------------
-- TRABALHAR
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function() 
    while true do
        Wait(0)
        local ped = PlayerPedId()
        local x,y,z = table.unpack(GetEntityCoords(ped))       
        if not service then 
            for k, v in pairs(LocaisRotas) do     
                local distance = GetDistanceBetweenCoords(x,y,z, v[1], v[2], v[3], true)
                if  distance < 15 then
                    DrawMarker(21, v[1], v[2], v[3], 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 0, 0, 255, 255, 1, 0, 0, 1)
                    if distance < 1.5 then
                        if IsControlJustPressed(0, 38) and GetEntityHealth(ped) > 101 then
                            if pcy.checkPermission("triade.permissao") then
								selecionado = 1
							elseif pcy.checkPermission("siciliana.permissao") then
								selecionado = 21
							elseif pcy.checkPermission("crips.permissao") then
								selecionado = 41
							elseif pcy.checkPermission("bloods.permissao") then
								selecionado = 61
							elseif pcy.checkPermission("bennys.permissao") then 
								PosRota = 81
							elseif pcy.checkPermission("bahamas.permissao") then
								selecionado = 101
							elseif pcy.checkPermission("lifeinvader.permissao") then
                                selecionado = 119
                            elseif pcy.checkPermission("galaxy.permissao") then
                                selecionado = 139
                            elseif pcy.checkPermission("native.permissao") then
								selecionado = 159
                            elseif pcy.checkPermission("driftking.permissao") then
                                selecionado = 189
                            end
							TriggerEvent('Notify', 'sucesso', 'Você iniciou a coleta de materiais.')
							service = true
							CriandoBlip(locs,selecionado)
                        end
                    end
                end
            end
		end
		
		if service then
			local ped = PlayerPedId()
			local x,y,z = table.unpack(GetEntityCoords(ped))
			local bowz,cdz = GetGroundZFor_3dCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
			local distance = Vdist(x,y,z,locs[selecionado].x,locs[selecionado].y,cdz)

			if distance <= 3 then
				DrawMarker(21,locs[selecionado].x,locs[selecionado].y,locs[selecionado].z-0.6,0,0,0,0.0,0,0,0.5,0.5,0.4,0,0,255,50,0,0,0,1)
				if distance <= 1.2 then
					drawTxt("APERTE ~r~E~w~ PARA COLETAR ",4,0.5,0.93,0.50,255,255,255,180)
					if IsControlJustPressed(0,38) and not IsPedInAnyVehicle(ped) then
						if pcy.checkPermission("crips.permissao") then
							if pcy.checkPayment("pecadearma") then
								vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
								TriggerEvent('cancelando',true)
								RemoveBlip(blips)
								processo = true
								segundos = 5
								if selecionado == 60 then
									selecionado = 41
								else
									Citizen.Wait(1)
									selecionado = selecionado + 1
									CriandoBlip(locs,selecionado)
								end
                            end

                        elseif pcy.checkPermission("bloods.permissao") then
                            
							if pcy.checkPayment("pecadearma") then
								vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
								TriggerEvent('cancelando',true)
								RemoveBlip(blips)
								processo = true
								segundos = 5

								if selecionado == 80 then
									selecionado = 61
								else
									Citizen.Wait(1)
									selecionado = selecionado + 1
									CriandoBlip(locs,selecionado)
								end
							end

						elseif pcy.checkPermission("siciliana.permissao") then

							if pcy.checkPayment("materialmunicao") then
								vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
								TriggerEvent('cancelando',true)
								RemoveBlip(blips)
								processo = true
								segundos = 5

								if selecionado == 40 then
									selecionado = 21
								else
									Citizen.Wait(1)
									selecionado = selecionado + 1
									CriandoBlip(locs,selecionado)
								end
							end

						elseif pcy.checkPermission("triade.permissao") then

							if pcy.checkPayment("materialmunicao") then
								vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
								TriggerEvent('cancelando',true)
								RemoveBlip(blips)
								processo = true
								segundos = 5

								if selecionado == 20 then
									selecionado = 1
								else
									Citizen.Wait(1)
									selecionado = selecionado + 1
									CriandoBlip(locs,selecionado)
								end
							end

						elseif pcy.checkPermission("bahamas.permissao") then

							if pcy.checkPayment("alvejante") then
								vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
								TriggerEvent('cancelando',true)
								RemoveBlip(blips)
								processo = true
								segundos = 5

								if selecionado == 118 then
									selecionado = 101
								else
									Citizen.Wait(1)
									selecionado = selecionado + 1
									CriandoBlip(locs,selecionado)
								end
							end

						elseif pcy.checkPermission("lifeinvader.permissao") then

							if pcy.checkPayment("alvejante") then
								vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
								TriggerEvent('cancelando',true)
								RemoveBlip(blips)
								processo = true
								segundos = 5

								if selecionado == 138 then
									selecionado = 119
								else
									Citizen.Wait(1)
									selecionado = selecionado + 1
									CriandoBlip(locs,selecionado)
								end
                            end
                            
                        elseif pcy.checkPermission("galaxy.permissao") then

							if pcy.checkPayment("fioeletronico") then
								vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
								TriggerEvent('cancelando',true)
								RemoveBlip(blips)
								processo = true
								segundos = 5

								if selecionado == 138 then
									selecionado = 119
								else
									Citizen.Wait(1)
									selecionado = selecionado + 1
									CriandoBlip(locs,selecionado)
								end
                            end

                        elseif pcy.checkPermission("native.permissao") then

                            if pcy.checkPayment("metal") then
                                vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
                                TriggerEvent('cancelando',true)
                                RemoveBlip(blips)
                                processo = true
                                segundos = 5

                                if selecionado == 178 then
                                    selecionado = 159
                                else
                                    Citizen.Wait(1)
                                    selecionado = selecionado + 1
                                    CriandoBlip(locs,selecionado)
                                end
                            end

                        elseif pcy.checkPermission("driftking.permissao") then

                            if pcy.checkPayment("metal") then
                                vRP._playAnim(true,{{"pickup_object","pickup_low"}},false)
                                TriggerEvent('cancelando',true)
                                RemoveBlip(blips)
                                processo = true
                                segundos = 5

                                if selecionado == 208 then
                                    selecionado = 189
                                else
                                    Citizen.Wait(1)
                                    selecionado = selecionado + 1
                                    CriandoBlip(locs,selecionado)
                                end
                            end
                        end
					end
				end
            end

            if IsControlJustPressed(0,168) then
                if blip then
                    RemoveBlip(blips)
                    blip = false
                end
                service = false
                TriggerEvent('Notify', 'sucesso', 'Você finalizou a coleta de materiais.')
            end
        end
    end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- TIMERS
-----------------------------------------------------------------------------------------------------------------------------------------
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		if segundos > 0 then
			segundos = segundos - 1
			if segundos == 0 then
				processo = false
				TriggerEvent('cancelando',false)
				ClearPedTasks(PlayerPedId())
				vRP._DeletarObjeto()
			end
		end
	end
end)
-----------------------------------------------------------------------------------------------------------------------------------------
-- DRAWTXT
-----------------------------------------------------------------------------------------------------------------------------------------
function drawTxt(text,font,x,y,scale,r,g,b,a)
	SetTextFont(font)
	SetTextScale(scale,scale)
	SetTextColour(r,g,b,a)
	SetTextOutline()
	SetTextCentre(1)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x,y)
end
-----------------------------------------------------------------------------------------------------------------------------------------
-- CRIANDOBLIP
-----------------------------------------------------------------------------------------------------------------------------------------
function CriandoBlip(locs,selecionado)
	blips = AddBlipForCoord(locs[selecionado].x,locs[selecionado].y,locs[selecionado].z)
	SetBlipSprite(blips,1)
	SetBlipColour(blips,5)
	SetBlipScale(blips,0.4)
	SetBlipAsShortRange(blips,false)
	SetBlipRoute(blips,true)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Coletar materiais")
	EndTextCommandSetBlipName(blips)
end
