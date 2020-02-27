package pro.olimpus.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pro.olimpus.entities.OlimpusWeight;
import pro.olimpus.entities.Thing;
import pro.olimpus.repo.OlimpusRepo;
import pro.olimpus.repo.ThingRepo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class MainController {
    private OlimpusRepo olimpusRepo;
    private ThingRepo thingRepo;
    @Autowired
    public void setThingRepo(ThingRepo thingRepo){this.thingRepo = thingRepo;}
    @Autowired
    public void setOlimpusRepo(OlimpusRepo olimpusRepo){ this.olimpusRepo = olimpusRepo;}

    @GetMapping()
    public String main(Model model){
        DateFormat dateFormat = new SimpleDateFormat("HH:mm");
        Date startDate = new Date();
        Calendar endDate = Calendar.getInstance();
        endDate .setTime(startDate);
        endDate.add(Calendar.HOUR, 1);
        model.addAttribute("startDate", dateFormat.format(startDate));
        model.addAttribute("endDate", dateFormat.format(endDate.getTime()));
        Iterable<Thing> things = thingRepo.findAll();
        model.addAttribute("things", things);
        return "main";
    }
    @PostMapping("/addData")
    public String addData(@RequestParam double startWeight,
                          @RequestParam double endWeight,
                          @RequestParam String startDate,
                          @RequestParam String endDate,
                          @RequestParam Set<String> selectedThings,
                          Model model){
        System.out.println(selectedThings.size());
        Set <Thing> things = new HashSet<>();
        for (String  selected : selectedThings){
            things.add(thingRepo.getThingByThingmame(selected));
        }
        OlimpusWeight olimpusWeight = new OlimpusWeight(startDate, endDate, startWeight, endWeight, new java.sql.Date((new Date()).getTime()), things);

        olimpusRepo.save(olimpusWeight);
        model.addAttribute("answer", "Данные внесены");
        model.addAttribute("startWeight", startWeight);
        model.addAttribute("endWeight", endWeight);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("things", thingRepo.findAll());
        return "main";
    }
    @GetMapping("/addThing")
    public String addThingPage(Model model){
        model.addAttribute("things", thingRepo.findAll());
        return "addthing";
    }
    @PostMapping("/addThing")
    public String addThing(@RequestParam String name, @RequestParam(required = false, defaultValue = "0") double weight, @RequestParam(required = false, defaultValue = "false") boolean isDefault, Model model){
        Thing thing = thingRepo.getThingByThingmame(name);
        if (thing != null){
            model.addAttribute("answer", "Такая вещь уже есть в БД");
        }else {
            thing = new Thing();
            thing.setDef(isDefault);
            thing.setThingmame(name);
            thing.setWeight(weight);
            thingRepo.save(thing);
            model.addAttribute("answer", "Данные внесены");
        }
        model.addAttribute("name", name);
        model.addAttribute("weight", weight);
        model.addAttribute("isDefault", isDefault);
        model.addAttribute("things", thingRepo.findAll());
        return "addthing";
    }
    @GetMapping("/history")
    public String history(Model model){
        Iterable<OlimpusWeight> ow = olimpusRepo.findAll();
        model.addAttribute("weights", ow);
        return "/history";
    }
}
