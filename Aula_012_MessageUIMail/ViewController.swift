
import UIKit
import MessageUI

class ViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

    }


    //MARK: Actions
    @IBAction func enviarEmail(_ sender: UIButton) {
        if MFMailComposeViewController.canSendMail() {
            
            //Cria um elemento de MessageUI para email
            let meuEmail = MFMailComposeViewController()
            
            //Determina o delegate
            meuEmail.mailComposeDelegate = self
            
            //Assunto do email
            meuEmail.setSubject("Assunto do Email")
            
            //Corpo do email
            meuEmail.setMessageBody("<b><i>Area destinada ao conteudo da mensagem </i></b>", isHTML: true)
            
            //Destinatarios principais
            let arrayDestinatarios = ["alguem@lugar.com.br"]
            meuEmail.setToRecipients(arrayDestinatarios)
            
            //Destinatarios com cópia
            let arrayDestCopia = ["primeira@lugar.com.br","segunda@lugar.com.br"]
            meuEmail.setCcRecipients(arrayDestCopia)
            
            //Destinatarios com cópia oculta
            let arrayDestOculta = ["primeiraOculta@lugar.com.br","segundaOculta@lugar.com.br"]
            meuEmail.setBccRecipients(arrayDestOculta)
            
            //Incluir anexos
            let imagemAnexo = UIImagePNGRepresentation(UIImage(named: "imagem.png")!)
            meuEmail.addAttachmentData(imagemAnexo!, mimeType: "image/png", fileName: "imagemFinal")
            
            present(meuEmail, animated: true)
            
            
        } else {
            let alerta = UIAlertController(title: "Alerta", message: "Não é possivel enviar mensagens", preferredStyle: .alert)
            let botao = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(botao)
                
            self.present(alerta, animated: true)
        }
    }
    
    
    //MARK: Metodos de MFMailComposeViewControllerDelegate
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}

