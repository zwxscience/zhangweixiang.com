function Getsolarterms() {
    var jq = new Array('0105小寒', '0120大寒', '0203立春', '0218雨水', '0305惊蛰', '0320春分', '0404清明', '0419谷雨', '0505立夏', '0520小满', '0605芒种', '0621夏至', '0706小暑', '0722大暑', '0807立秋', '0822处暑', '0907白露', '0922秋分', '1008寒露', '1023霜降', '1107立冬', '1122小雪', '1206大雪', '1221冬至');
    var d = new Date();
    var s = '';
    if (d.getMonth() < 9) s += '0';
    s += '' + (d.getMonth() + 1);
    if (d.getDate() < 10) s += '0';
    s += '' + (d.getDate());
    var i = 0;
    while (i < jq.length && s >= jq[i]) i++; i--;
    //  document.write('今天是', d.getYear(), '年', d.getMonth() + 1, '月', d.getDate(), '日 正处于', jq[i].substr(4));
    return jq[i].substr(4);
}