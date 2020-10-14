package control.home;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import java.io.IOException;


@Controller
public class HomeCtrl {

	@RequestMapping("/home")
	public String home(Model a) throws IOException {

		Connection connection_nifty = Jsoup.connect(
				"https://www.google.com/search?q=NSE:+nifty&stick=H4sIAAAAAAAAAONgecRoxi3w8sc9YSndSWtOXmNU5-IKzsgvd80rySypFJLkYoOy-KV4ubj10_UNU8pMq9Liy3kAritWbzsAAAA&tbm=fin#scso=_1lglX6D4N8Ca4-EPuLKG8Ag1:0,_VFolX6LCJLrG4-EP-cCfgA81:0,_q1olX6ykBp-W4-EPkvy3uAk1:0");
		Document doc = connection_nifty.get();

		Connection connection_sensex = Jsoup.connect(
				"https://www.google.com/search?q=NSE:+sensex&stick=H4sIAAAAAAAAAONgecRoxi3w8sc9YSndSWtOXmNU5-IKzsgvd80rySypFJLkYoOy-KV4ubj10_UNU8pMq9Liy3kAritWbzsAAAA&tbm=fin#scso=_1lglX6D4N8Ca4-EPuLKG8Ag1:0,_VFolX6LCJLrG4-EP-cCfgA81:0,_q1olX6ykBp-W4-EPkvy3uAk1:0");
		Document doc_sensex = connection_sensex.get();

		// nifty data gathering

		Elements price = doc.select("span.IsqQVc.NprOob.XcVN5d");
		Elements change = doc.select(".fw-price-dn.IsqQVc.WlRRw");
		Elements open = doc.select("div.ZSM8k:nth-of-type(1) > table > tbody > tr:nth-of-type(1) > .iyjjgb");
		Elements low = doc.select("div.ZSM8k:nth-of-type(2) > table > tbody > tr:nth-of-type(1) > .iyjjgb");
		Elements high = doc.select("tr:nth-of-type(2) > .iyjjgb");
		Elements Disc = doc.select(".TgMHGc > span:nth-of-type(2)");

		String name = "nifty";
		String price_nifty = price.text();
		String change_nifty = change.text();
		String open_nifty = open.text();
		String low_nifty = low.text();
		String high_nifty = high.text();
		String disc_nifty = Disc.text();

		// sensex data

		Elements price1 = doc_sensex.select("span.IsqQVc.NprOob.XcVN5d");
		Elements change1 = doc_sensex.select(".fw-price-dn.IsqQVc.WlRRw");
		Elements open1 = doc_sensex.select("div.ZSM8k:nth-of-type(1) > table > tbody > tr:nth-of-type(1) > .iyjjgb");
		Elements low1 = doc_sensex.select("div.ZSM8k:nth-of-type(2) > table > tbody > tr:nth-of-type(1) > .iyjjgb");
		Elements high1 = doc_sensex.select("tr:nth-of-type(2) > .iyjjgb");

		String price_sensex = price1.text();
		String change_sensex = change1.text();
		String open_sensex = open1.text();
		String low_sensex = low1.text();
		String high_sensex = high1.text();

		a.addAttribute("name", name);
		a.addAttribute("price_nifty", price_nifty);
		a.addAttribute("change_nifty", change_nifty);
		a.addAttribute("open_nifty", open_nifty);
		a.addAttribute("high_nifty", high_nifty);
		a.addAttribute("low_nifty", low_nifty);
		a.addAttribute("disc", disc_nifty);

		a.addAttribute("price_sensex", price_sensex);
		a.addAttribute("change_sensex", change_sensex);
		a.addAttribute("open_sensex", open_sensex);
		a.addAttribute("high_sensex", high_sensex);
		a.addAttribute("low_sensex", low_sensex);

		return "home";
	}

	@RequestMapping(value = "sendData", method = RequestMethod.POST)
	public String sendData(HttpServletRequest request, Model a) throws IOException{
		
		String s=request.getParameter("stock");

		Connection connection_stock = Jsoup.connect("https://www.google.com/search?q=NSE:+" + s
				+ "&stick=H4sIAAAAAAAAAONgecRoxi3w8sc9YSndSWtOXmNU5-IKzsgvd80rySypFJLkYoOy-KV4ubj10_UNU8pMq9Liy3kAritWbzsAAAA&tbm=fin#scso=_1lglX6D4N8Ca4-EPuLKG8Ag1:0,_VFolX6LCJLrG4-EP-cCfgA81:0,_q1olX6ykBp-W4-EPkvy3uAk1:0");
		Document doc_stock = connection_stock.get();

		Elements stock_price = doc_stock.select("span.IsqQVc.NprOob.XcVN5d");
		Elements stock_change = doc_stock.select(".fw-price-dn.IsqQVc.WlRRw");
		Elements stock_open = doc_stock	.select("div.ZSM8k:nth-of-type(1) > table > tbody > tr:nth-of-type(1) > .iyjjgb");
		Elements stock_low = doc_stock.select("div.ZSM8k:nth-of-type(1) > table > tbody > tr:nth-of-type(3) > .iyjjgb");
		Elements stock_high = doc_stock.select("div.ZSM8k:nth-of-type(1) > table > tbody > tr:nth-of-type(2) > .iyjjgb");
		Elements PE=doc_stock.select("div.ZSM8k:nth-of-type(1) > table > tbody >tr:nth-of-type(5) > .iyjjgb");
		Elements ultimate_high=doc_stock.select("div.ZSM8k:nth-of-type(2) > table > tbody > tr:nth-of-type(3) > .iyjjgb");
		Elements ultimate_low=doc_stock.select("div.ZSM8k:nth-of-type(2) > table > tbody > tr:nth-of-type(4) > .iyjjgb");
		Elements stock_close=doc_stock.select("div.ZSM8k:nth-of-type(2) > table > tbody > tr:nth-of-type(2) > .iyjjgb");
		
		
		
		
		
		
		String price_stock = stock_price.text();
		String change_stock = stock_change.text();
		String open_stock = stock_open.text();
		String low_stock = stock_low.text();
		String high_stock = stock_high.text();
		String PE_ratio=PE.text();
		String name = "stock";
		String close_stock=stock_close.text();
		String high_ultimate=ultimate_high.text();
		String low_ultimate=ultimate_low.text();
		
		

		a.addAttribute("name", name);
		a.addAttribute("s", s);
		a.addAttribute("price_stock", price_stock);
		a.addAttribute("change_stock", change_stock);
		a.addAttribute("open_stock", open_stock);
		a.addAttribute("high_stock", high_stock);
		a.addAttribute("low_stock", low_stock);
		a.addAttribute("PE_ratio", PE_ratio);
		a.addAttribute("close_stock", close_stock);
		a.addAttribute("high_ultimate", high_ultimate);
		a.addAttribute("low_ultimate", low_ultimate);
		

		return "home";
	}


	@RequestMapping(value = "/sendBrokerage", method = RequestMethod.POST)
	public String sendBrokerage(HttpServletRequest request, Model a) {
		String buy=request.getParameter("buy");
		String sell=request.getParameter("sell");
		String quantity=request.getParameter("quantity");
		int b = Integer.parseInt(buy);
		int s= Integer.parseInt(sell);
		int q= Integer.parseInt(quantity);
		int turnover=(q*b)+(q*s);
		double br=(double) Math.round(((0.03*turnover)/100) * 100) / 100;
		double sst=(double) Math.round(((0.03*turnover)/100) * 100) / 100;
		double ec=sst/2;
		double gst=(double) Math.round(ec/2 * 100) / 100;
		double total=(double) Math.round((sst+ec+gst+br )* 100) / 100;
		int c=0;
		double p=0.5;
		double pl=(double) Math.round((((q*s)-(q*b))-total) * 100) / 100;
		a.addAttribute("page", "brokerage");
		a.addAttribute("turnover", turnover);
		a.addAttribute("sst", sst);
		a.addAttribute("gst", gst);
		a.addAttribute("total", total);
		a.addAttribute("br", br);
		a.addAttribute("sst", sst);
		a.addAttribute("c", c);
		a.addAttribute("ec", ec);
		a.addAttribute("p", p);
		a.addAttribute("pl", pl);
		a.addAttribute("buy", buy);
		a.addAttribute("sell", sell);
		a.addAttribute("quantity", quantity);
		return "home";
	}
	
	
	
	@RequestMapping(value = "/sendDeliveryBrokerage", method = RequestMethod.POST)
	public String sendDeliveryBrokerage(HttpServletRequest request, Model a) {
		String buy=request.getParameter("buy");
		String sell=request.getParameter("sell");
		String quantity=request.getParameter("quantity");
		int buy1 = Integer.parseInt(buy);
		int sell1= Integer.parseInt(sell);
		int quantity1= Integer.parseInt(quantity);
		int turnover1=(quantity1*buy1)+(quantity1*sell1);
		double br1=(double) Math.round(((0.02*turnover1)/100) * 100) / 100;
		double sst1=(double) Math.round(((0.03*turnover1)/100) * 100) / 100;
		double ec1=sst1/2;
		int c1=0;

		double gst1=(double) Math.round(ec1/2 * 100) / 100;
		double total1=(double) Math.round((sst1+ec1+gst1+br1)* 100) / 100;
		
		double p1=2.5;
		double pl1=(double) Math.round((((quantity1*sell1)-(quantity1*buy1))-total1) * 100) / 100;
		a.addAttribute("page", "brokerage");
		a.addAttribute("turnover1", turnover1);
		a.addAttribute("sst1", sst1);
		a.addAttribute("gst1", gst1);
		a.addAttribute("total1", total1);
		a.addAttribute("br1", br1);
		a.addAttribute("sst1", sst1);
		a.addAttribute("c1", c1);
		a.addAttribute("ec1", ec1);
		a.addAttribute("p1", p1);
		a.addAttribute("pl1", pl1);
		a.addAttribute("buy1", buy1);
		a.addAttribute("sell1", sell1);
		a.addAttribute("quantity1", quantity1);
		return "home";
	}
	
	
	
	

	@RequestMapping("/stocks")
	public String Stocks(Model a) {
		String str = "Buy/Sell stocks";
		a.addAttribute("page", str);
		return "home";
	}

	@RequestMapping("/brokerage")
	public String brokerage(Model a) {
		a.addAttribute("page", "brokerage");
		return "home";
	}

}
