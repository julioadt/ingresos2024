<%-- 
    Document   : ingresados
    Created on : 1 oct. 2024, 14:20:53
    Author     : alumno
--%>
public class Ingresante {
private String nombre;
private String apellido;
private String dni;

public Ingresante(String nombre, String apellido, String dni) {
this.nombre = nombre;
this.apellido = apellido;
this.dni = dni;
}

// Getters y Setters
public String getNombre() { return nombre; }
public String getApellido() { return apellido; }
public String getDni() { return dni; }
}



import java.util.ArrayList;
import java.util.List;

public class ListaNominal {
private List<Ingresante> ingresantes;

    public ListaNominal() {
    ingresantes = new ArrayList<>();
    }

    public void agregarIngresante(Ingresante ingresante) {
    ingresantes.add(ingresante);
    }

    public List<Ingresante> obtenerIngresantes() {
        return ingresantes;
        }
        }
        o
        import javax.swing.*;
        import java.awt.event.ActionEvent;
        import java.awt.event.ActionListener;

        public class VentanaIngresantes extends JFrame {
        private ListaNominal listaNominal;

        public VentanaIngresantes() {
        listaNominal = new ListaNominal();

        setTitle("Lista Nominal de Ingresantes");
        setSize(400, 300);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(null);

        JLabel nombreLabel = new JLabel("Nombre:");
        nombreLabel.setBounds(10, 10, 80, 25);
        add(nombreLabel);

        JTextField nombreField = new JTextField();
        nombreField.setBounds(100, 10, 160, 25);
        add(nombreField);

        JLabel apellidoLabel = new JLabel("Apellido:");
        apellidoLabel.setBounds(10, 40, 80, 25);
        add(apellidoLabel);

        JTextField apellidoField = new JTextField();
        apellidoField.setBounds(100, 40, 160, 25);
        add(apellidoField);

        JLabel dniLabel = new JLabel("DNI:");
        dniLabel.setBounds(10, 70, 80, 25);
        add(dniLabel);

        JTextField dniField = new JTextField();
        dniField.setBounds(100, 70, 160, 25);
        add(dniField);

        JButton agregarButton = new JButton("Agregar");
        agregarButton.setBounds(10, 100, 250, 25);
        add(agregarButton);

        JTextArea areaLista = new JTextArea();
        areaLista.setBounds(10, 130, 350, 120);
        add(areaLista);

        agregarButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent e) {
        String nombre = nombreField.getText();
        String apellido = apellidoField.getText();
        String dni = dniField.getText();

        Ingresante ingresante = new Ingresante(nombre, apellido, dni);
        listaNominal.agregarIngresante(ingresante);

        areaLista.append(nombre + " " + apellido + " - DNI: " + dni + "\n");

        nombreField.setText("");
        apellidoField.setText("");
        dniField.setText("");
        }
        });

        setVisible(true);
        }

        public static void main(String[] args) {
        new VentanaIngresantes();
        }
        }