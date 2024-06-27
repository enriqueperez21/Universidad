import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

public class ParallelFibonacci {

    public static void main(String[] args) {
        int fibonacci_number =  Integer.parseInt(args[0]);
        int cant =    Integer.parseInt(args[1]);
        int threads = Integer.parseInt(args[2]);
        System.out.println(fibonacci_number +" "+ cant +" "+ threads);
        int[] numbers = getArray(cant, fibonacci_number);
        ExecutorService executor = Executors.newFixedThreadPool(threads);


        long startTime = System.currentTimeMillis(); // Inicio del cronómetro
        
        for (int number : numbers) {
            executor.submit(() -> {
                System.out.println("Fibonacci(" + number + ") = " + fibonacci(number));
            });
        }

        executor.shutdown();
        try {
            executor.awaitTermination(Long.MAX_VALUE, TimeUnit.NANOSECONDS);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }

        long endTime = System.currentTimeMillis(); // Fin del cronómetro
        long totalTime = endTime - startTime;

        System.out.println("Tiempo total de ejecución: " + totalTime + " milisegundos");
    }

    public static int[] getArray(int cant, int number){
        int numbers[] = new int[cant];
        for(int index = 0; index < cant; index++ ){
            numbers[index] = number;
        }
        return numbers;
    }

    public static long fibonacci(int n) {
        if (n <= 1) return n;
        else return fibonacci(n - 1) + fibonacci(n-2);
    }
}