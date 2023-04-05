import javax.swing.*;
import javax.swing.filechooser.FileNameExtensionFilter;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;

public class CompilerGUI {
    public static void main(String[] args) {
        JFrame frame = new JFrame("C Compiler");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(800, 600);

        JPanel panel = new JPanel();
        frame.add(panel);
        placeComponents(panel);

        frame.setVisible(true);
    }

    private static void placeComponents(JPanel panel) {
        panel.setLayout(null);

        JLabel inputLabel = new JLabel("Input File:");
        inputLabel.setBounds(10, 20, 80, 25);
        panel.add(inputLabel);

        JTextField inputFileField = new JTextField(20);
        inputFileField.setBounds(100, 20, 165, 25);
        panel.add(inputFileField);

        JButton browseButton = new JButton("Browse");
        browseButton.setBounds(280, 20, 90, 25);
        panel.add(browseButton);

        //JTextArea inputTextArea = new JTextArea();
       // inputTextArea.setBounds(10, 60, 760, 200);
        //panel.add(inputTextArea);
        //inputScrollPane.setBounds(10, 60, 760, 200);
        //panel.add(inputScrollPane);
        JTextArea inputTextArea = new JTextArea();
        JScrollPane inputScrollPane = new JScrollPane(inputTextArea);
        inputScrollPane.setBounds(10, 60, 760, 200);
        panel.add(inputScrollPane);

        JButton compileButton = new JButton("Compile");
        compileButton.setBounds(10, 270, 80, 25);
        panel.add(compileButton);

        /*JTextArea outputTextArea = new JTextArea();
        outputTextArea.setBounds(10, 310, 760, 240);
        outputTextArea.setEditable(false);
        outputTextArea.setForeground(Color.WHITE);
        outputTextArea.setBackground(Color.BLACK);
        panel.add(outputTextArea);*/

        JTextArea outputTextArea = new JTextArea();
        outputTextArea.setEditable(false);
        outputTextArea.setForeground(Color.WHITE);
        outputTextArea.setBackground(Color.BLACK);
        JScrollPane outputScrollPane = new JScrollPane(outputTextArea);
        outputScrollPane.setBounds(10, 310, 760, 240);
        panel.add(outputScrollPane);

        browseButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                JFileChooser fileChooser = new JFileChooser();
                FileNameExtensionFilter filter = new FileNameExtensionFilter("Text Files", "txt");
                fileChooser.setFileFilter(filter);
                int returnValue = fileChooser.showOpenDialog(null);
                if (returnValue == JFileChooser.APPROVE_OPTION) {
                    File selectedFile = fileChooser.getSelectedFile();
                    inputFileField.setText(selectedFile.getAbsolutePath());
                }
            }
        });

        compileButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String inputFile = inputFileField.getText();
                String inputText = inputTextArea.getText();

                if (!inputFile.isEmpty() || !inputText.isEmpty()) {
                    try {
                        if (!inputFile.isEmpty()) {
                            runExecutable(inputFile, outputTextArea);
                        } else {
                            Path tempFile = Files.createTempFile("tempInput", ".txt");
                            Files.write(tempFile, inputText.getBytes());
                            runExecutable(tempFile.toString(), outputTextArea);
                            Files.deleteIfExists(tempFile);
                        }
                    } catch (IOException | InterruptedException ex) {
                        ex.printStackTrace();
                    }
                } else {
                    outputTextArea.setText("No input provided.\n");
                }
            }
        });
    }

    private static void runExecutable(String inputFile, JTextArea outputTextArea) throws IOException, InterruptedException {
        String executablePath = "C:\\Users\\odane\\Desktop\\My_compiler\\my_program.exe"; // Replace this with the actual path to your executable

        ProcessBuilder processBuilder = new ProcessBuilder(executablePath);
        processBuilder.redirectInput(new File(inputFile));
        Process process = processBuilder.start();

        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        StringBuilder output = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            output.append(line).append("\n");
        }

        int exitCode = process.waitFor();
        /*if (exitCode == 0) {
            output.append("Execution successful!\n");
        } else {
            output.append("Execution failed with exit code ").append(exitCode).append(".\n");
        }*/

        outputTextArea.setText(output.toString());
    }
}
