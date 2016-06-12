/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Point;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;
import javax.swing.AbstractAction;
import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextField;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Max
 */

class MyButton extends JButton {

    private boolean isLastButton;
    private int id;

    public MyButton(int id) {

        super();
        
        initUI(id);
    }

    public MyButton(Image image, int id) {

        super(new ImageIcon(image));

        initUI(id);
    }

    public int getId(){
        return id;
    }
    
    private void initUI(int id) {

        isLastButton = false;
        this.id = id;
        BorderFactory.createLineBorder(Color.gray);

        addMouseListener(new MouseAdapter() {

            @Override
            public void mouseEntered(MouseEvent e) {
                setBorder(BorderFactory.createLineBorder(Color.yellow));
            }

            @Override
            public void mouseExited(MouseEvent e) {
                setBorder(BorderFactory.createLineBorder(Color.gray));
            }
        });
    }

    public void setLastButton() {
        
        isLastButton = true;
    }

    public boolean isLastButton() {

        return isLastButton;
    }
}

public class REST_Client extends javax.swing.JFrame {

    private JPanel panel;
    private BufferedImage source;
    private ArrayList<MyButton> buttons;

    ArrayList<Point> solution = new ArrayList();

    private Image image;
    private MyButton lastButton;
    private int width, height;
    private final int DESIRED_WIDTH = 300;
    private BufferedImage resized;

    public REST_Client(String id) {

        initUI(id);
    }

    private void initUI(String id) {

        solution.add(new Point(0, 0));
        solution.add(new Point(0, 1));
        solution.add(new Point(0, 2));
        solution.add(new Point(1, 0));
        solution.add(new Point(1, 1));
        solution.add(new Point(1, 2));
        solution.add(new Point(2, 0));
        solution.add(new Point(2, 1));
        solution.add(new Point(2, 2));

        buttons = new ArrayList();

        panel = new JPanel();
        panel.setBorder(BorderFactory.createLineBorder(Color.white));
        panel.setLayout(new GridLayout(3, 3, 0, 0));

        try {
            source = loadImage(id);
            int h = getNewHeight(source.getWidth(), source.getHeight());
            resized = resizeImage(source, DESIRED_WIDTH, h,
                    BufferedImage.TYPE_INT_ARGB);

        } catch (IOException ex) {
            Logger.getLogger(REST_Client.class.getName()).log(
                    Level.SEVERE, null, ex);
        }

        width = resized.getWidth(null);
        height = resized.getHeight(null);

        add(panel, BorderLayout.CENTER);
        
        int blockID = 0;
        
        for (int i = 0; i < 3; i++) {

            for (int j = 0; j < 3; j++) {

                image = createImage(new FilteredImageSource(resized.getSource(),
                        new CropImageFilter(j * width / 3, i * height / 3,
                                (width / 3), height / 3)));
                MyButton button = new MyButton(image, blockID);
                button.putClientProperty("position", new Point(i, j));

                if (i == 2 && j == 2) {
                    lastButton = new MyButton(blockID);
                    lastButton.setBorderPainted(false);
                    lastButton.setContentAreaFilled(false);
                    lastButton.setLastButton();
                    lastButton.putClientProperty("position", new Point(i, j));
                } else {
                    buttons.add(button);
                }
                
                blockID ++;
            }
        }

        System.out.println("Pre Shuffle: " + buttons.size());
        for (int i = 0; i < buttons.size(); i++){
            System.out.print(buttons.get(i).getId() + ", ");
        }
        
        Collections.shuffle(buttons);
        buttons.add(lastButton);
        
        System.out.println("Aprés Shuffle: " + buttons.size());
        for (int i = 0; i < buttons.size(); i++){
            System.out.print(buttons.get(i).getId() + ", ");
        }
        
        if(isSolvable(buttons)){
            for (int i = 0; i < 9; i++) {

            MyButton btn = buttons.get(i);
            panel.add(btn);
            btn.setBorder(BorderFactory.createLineBorder(Color.gray));
            btn.addActionListener((ActionListener) new ClickAction());
            }

            pack();
            setTitle("Pokemon Pussle");
            setResizable(false);
            setLocationRelativeTo(null);
        }
        else {
            initUI(id);
        }
    }
    
    // This method takes a two dimensional array representing
    // a sliding puzzle, and determines if it is solvable.
    public static boolean isSolvable(ArrayList<MyButton> p) {
        int inversions = 0;

        for(int i = 0; i < p.size() - 1; i++) {
            // Check if a larger number exists after the current
            // place in the array, if so increment inversions.
            for(int j = i + 1; j < p.size(); j++)
                if(p.get(i).getId() > p.get(j).getId()) inversions++;

            // Determine if the distance of the blank space from the bottom 
            // right is even or odd, and increment inversions if it is odd.
            if(p.get(i).getId() == 0 && i % 2 == 1) inversions++;
        }

        // If inversions is even, the puzzle is solvable.
        return (inversions % 2 == 0);
    }

    private int getNewHeight(int w, int h) {

        double ratio = DESIRED_WIDTH / (double) w;
        int newHeight = (int) (h * ratio);
        return newHeight;
    }

    private BufferedImage loadImage(String id) throws IOException {
        
        
        final String urlStr = "http://pokeapi.co/media/sprites/pokemon/" + id + ".png";
        final URL url = new URL(urlStr);
        final HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("User-Agent","Mozilla/5.0 (Macintosh; Intel Mac OS X 10_7_5) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.65 Safari/537.31");
        final BufferedImage image = ImageIO.read(connection.getInputStream());

        return image;
    }

    private BufferedImage resizeImage(BufferedImage originalImage, int width,
            int height, int type) throws IOException {

        BufferedImage resizedImage = new BufferedImage(width, height, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, width, height, null);
        g.dispose();

        return resizedImage;
    }

    private class ClickAction extends AbstractAction {

        @Override
        public void actionPerformed(ActionEvent e) {

            checkButton(e);
            checkSolution();
        }

        private void checkButton(ActionEvent e) {

            int lidx = 0;
            for (MyButton button : buttons) {
                if (button.isLastButton()) {
                    lidx = buttons.indexOf(button);
                }
            }

            JButton button = (JButton) e.getSource();
            int bidx = buttons.indexOf(button);

            if ((bidx - 1 == lidx) || (bidx + 1 == lidx)
                    || (bidx - 3 == lidx) || (bidx + 3 == lidx)) {
                Collections.swap(buttons, bidx, lidx);
                updateButtons();
            }
        }

        private void updateButtons() {

            panel.removeAll();

            for (JComponent btn : buttons) {

                panel.add(btn);
            }

            panel.validate();
        }
    }

    private void checkSolution() {

        ArrayList<Point> current = new ArrayList();

        for (JComponent btn : buttons) {
            current.add((Point) btn.getClientProperty("position"));
        }

        if (compareList(solution, current)) {
            JOptionPane.showMessageDialog(panel, "Finished",
                    "Congratulation", JOptionPane.INFORMATION_MESSAGE);
        }
    }

    public static boolean compareList(List ls1, List ls2) {
        return ls1.toString().contentEquals(ls2.toString());
    }
    
    // HTTP GET request
    private void sendGet(String id) throws Exception {

            String url = "http://pokeapi.co/api/v2/pokemon/" + id + "/";

            URL obj = new URL(url);
            HttpURLConnection con = (HttpURLConnection) obj.openConnection();

            // optional default is GET
            con.setRequestMethod("GET");

            //add request header
            con.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.95 Safari/537.11");

            int responseCode = con.getResponseCode();
            System.out.println("\nSending 'GET' request to URL : " + url);
            System.out.println("Response Code : " + responseCode);

            BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()));
            String inputLine;
            StringBuffer response = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                    response.append(inputLine);
            }
            in.close();

            
            final JFrame parent = new JFrame();
            
            JSONObject jsonObj = new JSONObject(response.toString());
            //NAME
            JLabel name = new JLabel("Name: " + jsonObj.getString("name"));
            name.setBounds(20,20,150,20);
            parent.add(name);
            
            //ABILITIES
            JSONArray abilities = jsonObj.getJSONArray("abilities");
            JLabel ab = new JLabel("Abilities:");
            ab.setBounds(20,50,150,20);
            parent.add(ab);
            for (int i=0; i<abilities.length(); i++) {
                JSONObject ability = abilities.getJSONObject(i);
                JLabel abi = new JLabel((i+1) + " - " + ability.getJSONObject("ability").getString("name"));
                abi.setBounds(40, 80 + i*30 ,150,20);
                parent.add(abi);
            }
            
            //TYPES
            int ofset1 = abilities.length() * 30;
            JSONArray types = jsonObj.getJSONArray("types");
            JLabel ty = new JLabel("Types:");
            ty.setBounds(20,80 + ofset1,150,20);
            parent.add(ty);
            for (int i=0; i<types.length(); i++) {
                JSONObject type = types.getJSONObject(i);
                JLabel tyi = new JLabel((i+1) + " - " + type.getJSONObject("type").getString("name"));
                tyi.setBounds(40, 110 + ofset1 + i*30 ,150,20);
                parent.add(tyi);
            }
            
            //STATS
            int ofset2 = types.length() * 30;
            JSONArray stats = jsonObj.getJSONArray("stats");
            JLabel st = new JLabel("Stats:");
            st.setBounds(20,110 + ofset1 + ofset2,150,20);
            parent.add(st);
            for (int i=0; i<stats.length(); i++) {
                JSONObject stat = stats.getJSONObject(i);
                JLabel sti = new JLabel(stat.getJSONObject("stat").getString("name") + " = " + stat.getInt("base_stat"));
                sti.setBounds(40, 140 + ofset1 + ofset2 + i*30 ,150,20);
                parent.add(sti);
            }
            
            //height
            int ofset3 = stats.length() * 30;
            JLabel height = new JLabel("Height: " + (float)jsonObj.getInt("height")/10 + "m");
            height.setBounds(20,140 + ofset1 + ofset2 + ofset3,150,20);
            parent.add(height);
            
            //weight
            JLabel weight = new JLabel("Weight: " + (float)jsonObj.getInt("weight")/10 + "Kg");
            weight.setBounds(20,170 + ofset1 + ofset2 + ofset3,150,20);
            parent.add(weight);
            
            
            parent.setSize(300, 300 + ofset1 + ofset2 + ofset3);  
            parent.setTitle("Pokemon Info");
            parent.setLayout(null);  
            parent.setVisible(true);
    }

    public static void main(String[] args) {

        final JFrame parent = new JFrame();
        
        JLabel text = new JLabel("Pokemon id: ");
        text.setBounds(50,70,150,20);
        
        JTextField tf;
        tf=new JTextField();  
        tf.setBounds(50,100,200,20);
        
        JButton button = new JButton();
        button.setText("Show Pokémon Puzzle");
        button.setBounds(50,150,200,30);
        
        JButton button2 = new JButton();
        button2.setText("Show Pokémon info");
        button2.setBounds(50,190,200,30);
        
        parent.add(text);
        parent.add(tf);
        parent.add(button);
        parent.add(button2);
        
        parent.setSize(300,300); 
        parent.setTitle("Pokéapi Client");
        parent.setLayout(null);  
        parent.setVisible(true);
        parent.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        button.addActionListener(new java.awt.event.ActionListener() {
            @Override
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                String id = tf.getText();
                
                EventQueue.invokeLater(new Runnable() {

                    @Override
                    public void run() {
                        REST_Client puzzle = new REST_Client(id);
                        puzzle.setVisible(true);
                    }
                });
            }
        });
        
        button2.addActionListener(new java.awt.event.ActionListener() {
            @Override
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                String id = tf.getText();
                
                EventQueue.invokeLater(new Runnable() {

                    @Override
                    public void run() {
                        REST_Client puzzle = new REST_Client(id);
                        try {
                            puzzle.sendGet(id);
                        } catch (Exception ex) {
                            Logger.getLogger(REST_Client.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                });
            }
        });
    }






/*

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 300, Short.MAX_VALUE)
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
*/
}
