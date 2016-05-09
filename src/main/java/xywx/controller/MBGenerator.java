package xywx.controller;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by wr520 on 2015/1/18.
 */
public class MBGenerator {
    public static void main(String[] main){
        try {
            List<String> warnings = new ArrayList<String>();
            boolean overwrite = true;

            File configFile = new File("f:\\need\\mybatis-generator\\generatorConfig.xml");

          //  File configFile = new File("C:\\Users\\Administrator\\Workspaces\\MyEclipse Professional\\scsj\\src\\generatorConfig.xml");

            ConfigurationParser cp = new ConfigurationParser(warnings);
            Configuration config = cp.parseConfiguration(configFile);
            DefaultShellCallback callback = new DefaultShellCallback(overwrite);
            MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
            myBatisGenerator.generate(null);
            System.out.println("操作成功!!!");
        }catch (Exception e){
            e.printStackTrace();

        }

    }
}
