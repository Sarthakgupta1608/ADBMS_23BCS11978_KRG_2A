import java.util.*;
import java.io.*;

public class E_Scuza {
    public static void main(String[] args) throws IOException {
        // Fast IO
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        StringBuilder output = new StringBuilder();
        StringTokenizer st;

        int t = Integer.parseInt(br.readLine().trim());
        while (t-- > 0) {
            st = new StringTokenizer(br.readLine());
            int n = Integer.parseInt(st.nextToken());
            int q = Integer.parseInt(st.nextToken());

            long[] p = new long[n + 1]; // prefix sum
            ArrayList<Long> v = new ArrayList<>();
            long cur = 0;

            st = new StringTokenizer(br.readLine());
            for (int i = 1; i <= n; i++) {
                long x = Long.parseLong(st.nextToken());
                p[i] = p[i - 1] + x;
                cur = Math.max(cur, x);
                v.add(cur);
            }

            st = new StringTokenizer(br.readLine());
            while (q-- > 0) {
                long x = Long.parseLong(st.nextToken());

                // upper_bound equivalent in Java
                int pos = upperBound(v, x);
                output.append(p[pos]).append(" ");
            }
            output.append("\n");
        }
        System.out.print(output.toString());
    }

    // upper_bound implementation in Java (first index > key)
    private static int upperBound(ArrayList<Long> arr, long key) {
        int low = 0, high = arr.size();
        while (low < high) {
            int mid = (low + high) >>> 1;
            if (arr.get(mid) <= key) {
                low = mid + 1;
            } else {
                high = mid;
            }
        }
        return low; // position
    }
}
