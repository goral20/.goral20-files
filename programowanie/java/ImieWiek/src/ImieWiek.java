import java.util.Scanner;

public class ImieWiek
{
	public static void main(String[]args)
	{
		Scanner in = new Scanner(System.in);
		System.out.print("Jak masz na imię? ");
		String name = in.nextLine();
		System.out.print("Ile masz lat? ");
		int age = in.nextInt();
		System.out.println("Witaj użytkowniku " + name + ". W przyszłym roku będziesz miał " + (age + 1) + " lat.");
	}	
}
