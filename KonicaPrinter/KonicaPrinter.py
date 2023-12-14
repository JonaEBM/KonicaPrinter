from asyncio.windows_events import NULL
from selenium import webdriver
from selenium.webdriver.edge.options import Options
from selenium.webdriver.common.by import By
from multiprocessing import Process
import time






#RUTA DEL DRIVER 
edge_driver_path = 'C:\\Users\\M0212394\\Documents\\KonicaPrinter\\KonicaPrinter\\env\\Driver\\msedgedriver.exe'

#CONFIGURACIÓN DEL NAVEGADOR EDGE
edge_options = Options() #INSTANCIA OPCIONES PARA EDGE
edge_options.use_chromium = True #UTILIZAR EL CONTROLADOR DE EDGE 
edge_options.add_argument("--headless") #NAVEGAR OCULTAMENTE
edge_options.add_argument("--log-level=3")#MUESTRA DE DATOS DE CONSOLA (LOGS)
edge_options.add_argument("--driver-path={edge_driver_path}") #ASIGNAR LA RUTA DEL CONTROLADOR DE EDGE A LAS OPCIONES

#CREACIÓN DE INSTANCIA
driver = webdriver.Edge(options = edge_options)









#FUNCIÓN PARA EXTRAER INFORMACIÓN DE LA PÁGINA WEB UTILIZANDO LA TÉCNICA DE WEBSCRAPING
def extractInformation(direction):
    try:
        driver.get(direction)
        try:
            #INFORMATION
            time.sleep(2)
            element = driver.find_element(By.ID,'ID_Menu_System') #IDENTIFICA EL BOTON A PRESIONAR
            element.click() #PRESIONA EL BOTON

            #DEVICE INFORMATION
            time.sleep(2)
            element = driver.find_element(By.ID,'ID_SubMenu_System_DeviceInfo') #IDENTIFICA EL BOTON A PRESIONAR
            element.click() #PRESIONA EL BOTON

            #CONSUMABLES
            time.sleep(2)
            element = driver.find_element(By.ID,'ID_SpareSubMenu_System_Consumables') #IDENTIFICA EL BOTON A PRESIONAR
            element.click() #PRESIONA EL BOTON

            #OBTIENE TODA LA INFORMACIÓN DEL IFRAME QUE CONTIENE LA INFOMACIÓN DE LOS TONER
            time.sleep(2)
            driver.switch_to.frame('contentsFrame')
            iframe_text = driver.find_element(By.XPATH, '//body').text

            #INVOCAMOS MÉTODO PARA FILTRAR LA INFORMACIÓN
            filterInformation(iframe_text, direction)

        except Exception as e: #EN CASO DE QUE NO SE ENCUENTRE EL ELEMENTO, REALIZAMOS OTRA BUSQUEDA
            print('Elemeto no encontrado\n')

        #driver.close()#CERRAR NAVEGADOR
        
    except Exception as e:
        print('\n----- Impresora: ', direction, ' -----\n') 
        print('No localizada...')









#FUNCIÓN PARA FILTRAR E Y GUARDAR SÓLO LA INFORMACIÓN NECESARIA
def filterInformation(iframe_text, direction):
    if iframe_text.__contains__('Yellow') : #IF QUE VALIDA SI EXISTE EL COLOR AMARILLO (CON ESTE SE DA POR HECHO QUE EXISTE CYAN Y MAGENTA) 
                
                tonerLevel = [iframe_text[38:41], iframe_text[50:53], iframe_text[59:62], iframe_text[69:72]] #LISTA QUE ALMACENA LAS SUBCADENAS QUE CORRESPONDEN A LOS NIVELES DE TONER
                saveInformation(tonerLevel, direction) #LLAMA A LA FUNCIÓN PARA ALMACENAR LA INFORMACIÓN

    elif iframe_text.__contains__('Black') :

                tonerLevel = [iframe_text[37:40]]
                saveInformation(tonerLevel, direction)

    else:
                print('Informacion no encontrada')









#FUNCIÓN QUE GUARDA LA INORMACIÓN EN UN EXCEL
def saveInformation(tonerLevel, direction):
    print('\n----- Impresora: ', direction, ' -----\n') 
    if len(tonerLevel) > 1:
        print('Yellow: ', tonerLevel[0]) #EXTRAE LA SUBCADENA QUE CONTIENE EL VALOR
        print('Magenta: ', tonerLevel[1])
        print('Cyan: ', tonerLevel[2])
        print('Black: ', tonerLevel[3])
    else:
        print('Black: ', tonerLevel[0])







#MAIN
if __name__ == '__main__':

    #CREAMOS UNA LISTA CON TODAS LAS IMPRESORAS
    printers = ['http://10.93.54.20', 'http://10.93.54.207', 'http://10.93.54.22', 'http://10.93.54.27', 'http://10.93.54.30',
    'http://10.93.19.31', 'http://10.93.19.43', 'http://10.93.19.44', 'http://10.93.19.46', 'http://10.93.19.47' ,'http://10.93.54.144',
    'http://10.93.54.16', 'http://10.93.54.36', 'http://10.93.54.11', 'http://10.93.54.135', 'http://10.93.54.23', 'http://10.93.54.247', 
    'http://10.93.54.140', 'http://10.93.54.208', 'http://10.93.54.35']

    #CREAMOS UNA LISTA DE PROCESOS
    processes = []

    #EJECUTAMOS MÉTODO PARA EXTRAER INFORMACIÓN POR CADA IMPRESORA EXISTENTE, 
    for printer in printers:
        p = Process(target=extractInformation, args=(printer, ))
        processes.append(p)
        p.start()

    #Editando desde pc
    for p in processes:
       p.join()

    driver.close()
















    
