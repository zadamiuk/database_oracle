package bd1projekt;

import oracle.jdbc.pool.OracleDataSource;

import java.io.IOException;
import java.sql.*;

// na podstawie kodow od prowadzacej

public class Main {

    Connection conn;

    public static void main(String[] args) {

        Main app = new Main();

        try {
            app.setConnection();
            app.showPatients();
            app.showDoctors("Kardiologia");
            app.showOperations(2019);
            app.closeConnection();
        }
        catch (SQLException | IOException eSQL) {
            System.out.println("Blad SQL " + eSQL.getMessage());
        }
        
    }

    public void setConnection() throws SQLException, IOException {
        String host = "ora4.ii.pw.edu.pl";
        String username = "z56";
        String password = "brinkc";
        String port = "1521";
        String serviceName = "pdb1.ii.pw.edu.pl";
        String connectionString = String.format(
                "jdbc:oracle:thin:%s/%s@//%s:%s/%s",
                username, password, host, port, serviceName);

        OracleDataSource ods;
        ods = new OracleDataSource();

        ods.setURL(connectionString);
        conn = ods.getConnection(); // nawiazujemy polaczenie z BD

        DatabaseMetaData meta = conn.getMetaData();

        System.out.println("Polaczenie do bazy danych zostalo nawiazane.");
        System.out.println("Baza danych:" + " " + meta.getDatabaseProductVersion());
    }

    public void closeConnection() throws SQLException {
        conn.close();
        System.out.println("Polaczenie z baza zostalo poprawnie zamkniete.");
    }

    public void showPatients() throws SQLException {
        System.out.println("Lista pacjentow:");

        Statement stat = conn.createStatement();

        // wydajemy zapytanie oraz zapisujemy rezultat w obiekcie typu ResultSet
        ResultSet rs = stat.executeQuery("SELECT imie, nazwisko FROM pacjenci");

        System.out.println("---------------------------------");
        // iteracyjnie odczytujemy rezultaty zapytania
        while (rs.next())
            System.out.println(rs.getString(1) + " " + rs.getString(2));
        System.out.println("---------------------------------");

        rs.close();
        stat.close();
    }
    
    public void showDoctors(String specjalizacja) throws SQLException {
        System.out.println("Lista lekarzy ze specjalizacja " + specjalizacja + ":");

        Statement stat = conn.createStatement();

        // wydajemy zapytanie oraz zapisujemy rezultat w obiekcie typu ResultSet
        ResultSet rs = stat.executeQuery("SELECT l.imie, l.nazwisko "
        								+ "FROM lekarze l "
        								+ "INNER JOIN lekarze_specjalizacje ls USING(id_lekarza) "
        								+ "INNER JOIN specjalizacje s USING(id_specjalizacji)"
        								+ "WHERE s.nazwa = '" + specjalizacja + "'");

        System.out.println("---------------------------------");
        // iteracyjnie odczytujemy rezultaty zapytania
        while (rs.next())
            System.out.println(rs.getString(1) + " " + rs.getString(2));
        System.out.println("---------------------------------");

        rs.close();
        stat.close();
    }
    
    public void showOperations(int rok) throws SQLException {
        System.out.println("Lista zabiegów w roku " + rok + ":");

        Statement stat = conn.createStatement();

        // wydajemy zapytanie oraz zapisujemy rezultat w obiekcie typu ResultSet
        ResultSet rs = stat.executeQuery("SELECT hz.data_zabiegu, z.nazwa, p.imie, p.nazwisko "
        								+ "FROM historia_zabiegow hz "
        								+ "INNER JOIN zabiegi z USING(id_zabiegu) "
        								+ "INNER JOIN pacjenci p USING(id_pacjenta) "
        								+ "WHERE EXTRACT(YEAR FROM data_zabiegu) = 2019");

        System.out.println("---------------------------------");
        // iteracyjnie odczytujemy rezultaty zapytania
        while (rs.next())
            System.out.println("Data zabiegu: " + rs.getString(1) + "\nNazwa zabiegu: " + rs.getString(2) + "\nImiê i nazwisko pacjenta: " + rs.getString(3) + " " + rs.getString(4) + "\n");
        System.out.println("---------------------------------");

        rs.close();
        stat.close();
    }

}
