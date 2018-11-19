public class bal {

    public integer findClosingParen(string[] text, integer openPos) {
    integer closePos = openPos;
    integer counter = 1;
    while (counter > 0) {
        string  c = text[++closePos];
        if (c == '(') {
            counter++;
        }
        else if (c == ')') {
            counter--;
        }
    }
    return closePos;
}
}